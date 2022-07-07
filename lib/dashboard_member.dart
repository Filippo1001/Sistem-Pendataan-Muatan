import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'profil_page.dart';
import 'tracking_page.dart';
import 'main.dart';
import 'dart:async';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DashboardMember extends StatefulWidget {
  @override
  static String tag = 'dashmember-page';
  _DashboardMemberState createState() => _DashboardMemberState();
}

class _DashboardMemberState extends State<DashboardMember> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TextEditingController controllerResi = TextEditingController();

  _prosestracking() async {
    String resi = controllerResi.text;
    SharedPreferences pref = await SharedPreferences.getInstance();
    //ref.clear();
    await pref.setString("resi", resi);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Tracking();
    }));
  }

  void _Gagal(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/images/logo.png",
      width: 150.0,
      height: 150.0,
    );

    final judul = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Cek Resi Pengiriman',
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );

    final noresi = TextFormField(
      controller: controllerResi,
      decoration: new InputDecoration(
        hintText: "Masukan No Resi",
        labelText: "Cek Resi Pengiriman",
        icon: Icon(Icons.book),
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
    );

    final tblproses = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 80.0,
          height: 50.0,
          onPressed: () {
            if (controllerResi.value.text.isEmpty) {
              setState(() {
                _Gagal(context, "No Resi tidak boleh kosong.");
              }); //ID gabole kosong
            } else {
              String resiku = controllerResi.text;
              launch(
                  'https://filipposkripsi.000webhostapp.com/laporan/tracking.php?resi=$resiku');
              //_prosestracking();
            }
          },
          color: Colors.green,
          child: Text('Proses', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          SizedBox(height: 20.0),
          logo,
          SizedBox(height: 20.0),
          judul,
          SizedBox(height: 8.0),
          noresi,
          SizedBox(height: 24.0),
          Column(children: [
            tblproses,
          ]),
        ],
      ),
    );
  }
}
