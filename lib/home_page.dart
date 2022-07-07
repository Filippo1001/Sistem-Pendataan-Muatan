import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'member_page.dart';
import 'about.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  final String msg;
  // wajib diisi
  const HomePage(this.msg, {Key? key}) : super(key: key);
  @override
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
        builder: (BuildContext context) => const MemberPage(),
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
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Beranda",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.info),
        label: 'About Me',
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
      appBar: AppBar(
        title: logo,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
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
