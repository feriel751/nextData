import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/home/Screens/homePage.dart';
import 'package:testapp/home/Screens/postsPage.dart';
import '../accountPage.dart';
import '../explorePage.dart';


class MainScreen extends StatefulWidget{
  final int initialIndex;
  const MainScreen({
    Key? key, required this.initialIndex,
  }) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {



  TabController? tabController;
  int selectedIndex = 0;
  // when ever item has been clicked
  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }



  @override
  void initState() {
    super.initState();


    tabController = TabController(initialIndex : widget.initialIndex ,length: 4, vsync: this);
  }

  BottomNavigationBarItem buildNavBarItem(
      {required String normalIcon,
        required String selectedIcon,
        required int index,
        required String label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: SvgPicture.asset(
              selectedIndex == index ? selectedIcon : normalIcon,
              fit: BoxFit.cover,
            width: 34,
            height: 34,
          ),
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          // here we have to pass our pages
          children: [

            HomePage(),
            postsPage(),
            explorePage(),
            AccountPage(),

           // list of pages
          ],
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
              items: [
                buildNavBarItem(
                  selectedIcon: "assets/images/home.svg",
                  normalIcon: "assets/images/home.svg",
                  label: "Home",
                  index: 0,
                ),
                buildNavBarItem(
                  selectedIcon: "assets/images/posts.svg",
                  normalIcon: "assets/images/posts.svg",
                  label: "Posts",
                  index: 1,
                ),
                buildNavBarItem(
                  selectedIcon: "assets/images/explore.svg",
                  normalIcon: "assets/images/explore.svg",
                  label: "Explore",
                  index: 2,
                ),
                buildNavBarItem(
                  selectedIcon: "assets/images/account.svg",
                  normalIcon: "assets/images/account.svg",
                  label: "Account",
                  index: 3,
                ),
              ],
              unselectedItemColor: Colors.grey,
              selectedItemColor: Color(0xFF1864D3),
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,

              //showUnselectedLabels: true,
              currentIndex: selectedIndex,
              onTap: onItemClicked,
            ),

        );
  }
}
