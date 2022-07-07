import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'dashboard_member.dart';
import 'about.dart';

class MemberPage extends StatefulWidget {
  static String tag = 'member-page';

  const MemberPage({Key? key}) : super(key: key);
  @override
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
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Beranda",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.lock),
        label: 'Admin',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.info),
        label: "About",
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
      backgroundColor: const Color(0xff329cef),
      body: Center(
        child: _children.elementAt(_selectedTabIndex),
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
