import 'package:flutter/material.dart';
import 'package:login_signup_demo/constants.dart';
import 'package:login_signup_demo/dashboard_screens/friends.dart';
import 'package:login_signup_demo/dashboard_screens/profile.dart';
import 'package:login_signup_demo/dashboard_screens/requests.dart';
import 'package:login_signup_demo/dashboard_screens/users.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  PageController pageController;
  int getPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  whenPageChanges(int pageIndex) {
    setState(() {
      this.getPageIndex = pageIndex;
    });
  }

  onTapChangePage(int pageIndex) {
    pageController.animateToPage(
        pageIndex, duration: Duration(milliseconds: 400),
        curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.appColor,
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: PageView(
          children: [
            UsersPage(),
            FriendsPage(),
            RequestsPage(),
            ProfilePage()
          ],
          controller: pageController,
          onPageChanged: whenPageChanges,

        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
         elevation: 5.0,
          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: getPageIndex,
          selectedItemColor: Colors.blueAccent,
         onTap: onTapChangePage,
        ),
      // bottomNavigationBar: BottomNavyBar(
      //  // type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavyBarItem(icon: ImageIcon(
      //         AssetImage("assets/user.png")),title: Text('Users'), activeColor: Constants.appColor,),
      //     BottomNavyBarItem(icon: ImageIcon(
      //         AssetImage("assets/friends.png")),title: Text('Friends'),activeColor: Constants.appColor),
      //     BottomNavyBarItem(icon: Icon(Icons.person_add_rounded),title: Text('Requests'),activeColor: Constants.appColor),
      //     BottomNavyBarItem(icon: Icon(Icons.person_outline),title: Text('Profile'),activeColor:  Constants.appColor),
      //   ],
      //   selectedIndex: getPageIndex,
      // //  currentIndex: getPageIndex,
      // //  onTap: onTapChangePage,
      //   onItemSelected: onTapChangePage,
      //  // selectedItemColor: Constants.appColor,
      // ),
    );
  }
}
