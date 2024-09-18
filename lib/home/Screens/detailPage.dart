import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Model/users.dart';

class detailsPage extends StatefulWidget{
  final Users user;
  const detailsPage({super.key, required this.user});
  @override
  _detailsPageState createState() => _detailsPageState();
}
class _detailsPageState extends State<detailsPage> {




  @override
  Widget build(BuildContext context) {
return
    Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(

          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
  title : Text(
    'Post details',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color:Color(0xFF2d3650),
      fontSize: 16,
      fontFamily: "Poppins-Bold",
    ),
    textAlign: TextAlign.start,
  ),




        ),
body: SingleChildScrollView(
        child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Divider(
        color: Color(0xFFC3D3E2),
        thickness: 1.0,
        height: 5,
      ),
SizedBox(height : 30),
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
          widget.user.name,
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
        'Title :',
        style: TextStyle(
          fontWeight:FontWeight.w400,
          color: Color(0xFF233453),
          fontSize: 14,
          fontFamily: "Poppins-Bold",
        ),
      ),
      SizedBox(height: 8),
      Text(
     widget.user.post!.title,
        style:  TextStyle(
          fontWeight:FontWeight.w400,
          color: Color(0xFF233453),
          fontSize: 12,
          fontFamily: "Poppins-Thin",
        ),
      ),
      SizedBox(height: 8),



       Divider(
          color: Color(0xFFC3D3E2),
          thickness: 1.0,
          height: 5,
        ),
      SizedBox(height: 8),

      Text(
        'Body:',
        style: TextStyle(
          fontWeight:FontWeight.w400,
          color: Color(0xFF233453),
          fontSize: 14,
          fontFamily: "Poppins-Bold",
        ),
      ),
      SizedBox(height: 8),
      Text(
        widget.user.post!.body,
        style: TextStyle(
          fontWeight:FontWeight.w400,
          color: Color(0xFF233453),
          fontSize: 12,
          fontFamily: "Poppins-Thin",
        ),
      ),
      SizedBox(height: 8),

      Divider(
        color: Color(0xFFC3D3E2),
        thickness: 1.0,
        height: 5,
      ),
      SizedBox(height: 8),

      Row(children: [
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
              'POST ID : ${widget.user.id}',
              style: TextStyle(
                color: Color(0xFF8696BB),
                fontSize: 12,
                fontFamily: "Poppins-Thin",
              ),
            ),
          ],
        ),
        SizedBox(width : 10.0),
        Row(
          children: [
            // svg image
            SvgPicture.asset(
              'assets/images/userid-icon.svg',
              width: 9,
              height: 11,
            ),
            SizedBox(width: 4),
            Text(
              'USER ID : ${widget.user.post!.userId}',
              style: TextStyle(
                color: Color(0xFF8696BB),
                fontSize: 12,
                fontFamily: "Poppins-Thin",
              ),
            ),
          ],
        ),

      ],),


    ],),),),








    );






  }




}