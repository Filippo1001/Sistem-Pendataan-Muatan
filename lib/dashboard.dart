import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'tracking/listdata.dart';
import 'customer/listdata.dart';
import 'tarif/listdata.dart';
import 'muatan/listdata.dart';
import 'pengguna/listdata.dart';
import 'pengiriman/listdata.dart';
import 'sopir/listdata.dart';
import 'lap_muatan.dart';
import 'lap_pengiriman.dart';
import 'main.dart';
import 'dart:async';
import 'dart:io';

class Dashboard extends StatefulWidget {
  @override
  static String tag = 'dashboard-page';
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State {
  String username = "";
  String nama = "";

  startSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString("username")!;
      nama = pref.getString("nama")!;
    });
  }

  @override
  void initState() {
    startSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Selamat Datang, $nama',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xff329cef),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            welcome,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //ROW 1
              children: [
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/Customer-icon.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(HomeCust.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Customer',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/driver-icon.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Sopir.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Sopir',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/tarif.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Tarif.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Tarif Kirim',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //ROW 1
              children: [
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/muatan-icon.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Muatan.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Muatan',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/pengiriman-icon.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Kirim.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Pengiriman',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/tracking.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(TrackingPage.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Tracking Pengiriman',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //ROW 1
              children: [
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/report-icon.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(LapMuatan.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Lap Muatan',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/report-icon.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(LapPengiriman.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Lap Pengiriman',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Column(children: [
                    FlatButton(
                      child: Image.asset(
                        "assets/images/user.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Pengguna.tag);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Pengguna',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
