import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/home/Screens/Model/users.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/home/Screens/detailPage.dart';
import '../../auth/Screens/widgets/loader.dart';
import 'Controllers/homeController.dart';
import 'Model/posts.dart';

class postsPage extends StatefulWidget{
  const postsPage({super.key});
  @override
  _postsPageState createState() => _postsPageState();
}
class _postsPageState extends State<postsPage> {
  List<Users>? listUsers;
  List<Users> filteredUsers=[];
  TextEditingController _searchController = TextEditingController();
  final homeController = Get.put(HomeController());
Posts? post = Posts(id: 0,
userId: 0, body :'' , title : '');
  fetchAllUsers() async {
    listUsers =
    await homeController.getUsersList();
    filteredUsers= listUsers!;
    if (!mounted) return;
    setState(() {});
  }


  fetchPost(int id ) async {
    post =
    await homeController.getUserById(id);
    if (!mounted) return;
    setState(() {});
  }
  @override
  void initState() {
    fetchAllUsers();
    _searchController.addListener(_filterPosts);
    super.initState();
  }
  void _filterPosts() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      filteredUsers = listUsers!.where((user) {
        return user.id.toString().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey.shade100,
       appBar:PreferredSize(
         preferredSize: Size.fromHeight(140),
         child: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor: Colors.white,
           flexibleSpace: SafeArea(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       IconButton(
                         icon: Icon(Icons.menu, size: 32,  color:Color(0xFF2d3650)),
                         onPressed: () {
                           // Handle menu button press
                         },
                       ),
                      Text(
                           'Browse posts',
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                             color:Color(0xFF2d3650),
                             fontSize: 16,
                             fontFamily: "Poppins-Bold",
                           ),
                           textAlign: TextAlign.start,
                         ),

                       SizedBox(width: 48),  // Balance the space taken by the menu icon
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                   child: TextField(
                     controller: _searchController,
                     decoration: InputDecoration(
                       hintText: 'Search...',

                       hintStyle: const TextStyle(
                           color:   Color(0xFF8A95C1),
                           fontFamily: "Poppins-Thin",
                           fontSize: 12),

                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide.none,
                       ),
                       filled: true,
                       fillColor: Color(0xFFF5f7FF),
                       prefixIcon: Icon(Icons.search,color :  Color(0xFF8A95C1)),
                       contentPadding: EdgeInsets.symmetric(vertical: 0),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ),

      /// list view
      body:

      filteredUsers!=null ?

      ListView.builder(
    itemCount: filteredUsers!.length,
    itemBuilder: (context, index) {
    return Card(
      color : Colors.white,
        margin: EdgeInsets.all(8.0),

   child : Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  child:SvgPicture.asset(
                    'assets/images/User (2).svg',
                    width: 31,
                    height: 31,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  filteredUsers![index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color :  Color(0xFF1864D3) ,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),
            Text(
              filteredUsers![index].post!=null?     filteredUsers![index].post!.title : '',
              style: TextStyle(
                fontWeight:FontWeight.w500,
                color: Color(0xFF050F20),
                fontSize: 10,
                fontFamily: "Poppins-Bold",
              ),
            ),







            SizedBox(height: 8),
            Text(   filteredUsers![index].post!=null?  filteredUsers![index].post!.body : '',
                style: TextStyle(
                  color: Color(0xFF121620),
                  fontSize: 10,
                  fontFamily: "Poppins-Light",
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 8),
            Row(
              children: [
              // svg image
                SvgPicture.asset(
                  'assets/images/post-icon.svg',
                  width: 9,
                  height: 11,
                ),
                SizedBox(width: 4),
                Text(
                  'POST ID : ${filteredUsers![index].id}',
                  style: TextStyle(
                    color: Color(0xFF8696BB),
                    fontSize: 12,
                    fontFamily: "Poppins-Thin",
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
          Center(
            child: Container(
              height :31 ,
                    width :350 ,
                    decoration: BoxDecoration(
                      color : Color(0xFFf5F7FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border(
                    right : BorderSide.none,
                       left :  BorderSide.none,
                       bottom: BorderSide.none,
                       top:  BorderSide.none,
                      ),
                    ) ,
                    child: InkWell(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(
                          builder: (c)=> detailsPage(user: filteredUsers![index],
                          ),
                        ));
                        
                      },
                      child: Center(
                        child: Text(
                          'Detail',
                          style: TextStyle(color: Color(0xFF4894FE),
                          fontSize: 13,
                            fontFamily: "Poppins-Thin",),
                        ),
                      ),
                    ),
                  ),
          ),

          
          ],
        ),
      ),



    );



      }) : Padding(
        padding: EdgeInsets.all(25.0),
        child: Container(
          height :242 , width: 328, color : Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top :30),
              child: Column(
                children: [

                  SvgPicture.asset(
                    'assets/images/Server Error.svg',
                    width: 128,
                    height: 116,
                  ),

                  SizedBox(height: 20,),
                  Text('Server Error Codes 5XX',


                    style: TextStyle(
                      fontWeight:FontWeight.w500,
                      color: Color(0xFFF07F19),
                      fontSize: 18,
                      fontFamily: "Poppins-Bold",
                    ),),

                ],
              ),
            ),
          ),




        ),
      ),

    );}}