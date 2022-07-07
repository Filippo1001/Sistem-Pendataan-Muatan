import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'lap_muatan.dart';
import 'lap_pengiriman.dart';
import 'profil_page.dart';
import 'tracking_page.dart';
import 'tracking/listdata.dart';
import 'customer/listdata.dart';
import 'tarif/listdata.dart';
import 'muatan/listdata.dart';
import 'pengguna/listdata.dart';
import 'pengiriman/listdata.dart';
import 'sopir/listdata.dart';
import 'member_page.dart';
import 'about.dart';
import 'dashboard.dart';
import 'main.dart';
import 'dart:async';
import 'dart:io';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  final String msg;
  // wajib diisi
  HomePage(this.msg);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("is_login");
      pref.remove("username");
      pref.remove("nama");
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MemberPage(),
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
      Dashboard(),
      About(),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Beranda'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
        title: Text('About Me'),
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
      appBar: AppBar(
        title: logo,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              logOut();
            },
          ),
        ],
      ),
      body: Center(
        child: _children.elementAt(_selectedTabIndex),
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
