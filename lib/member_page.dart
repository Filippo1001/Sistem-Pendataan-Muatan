import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'profil_page.dart';
import 'tracking_page.dart';
import 'dashboard_member.dart';
import 'about.dart';
import 'main.dart';
import 'dart:async';
import 'dart:io';

class MemberPage extends StatefulWidget {
  static String tag = 'member-page';
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  int _selectedTabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("is_login");
      preferences.remove("username");
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/images/logo.png",
      width: 100.0,
      height: 70.0,
    );

    final List<Widget> _children = [
      DashboardMember(),
      LoginPage(),
      About(),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Beranda'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.lock),
        title: Text('Admin'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
        title: Text('About'),
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );

    return Scaffold(
      backgroundColor: Color(0xff329cef),
      body: Center(
        child: _children.elementAt(_selectedTabIndex),
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
