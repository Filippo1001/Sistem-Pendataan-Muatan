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

  const DashboardMember({Key? key}) : super(key: key);
  @override
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

  void _gagal(BuildContext context, String error) {
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

    const judul = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Cek Resi Pengiriman',
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );

    final noresi = TextFormField(
      controller: controllerResi,
      decoration: InputDecoration(
        hintText: "Masukan No Resi",
        labelText: "Cek Resi Pengiriman",
        icon: const Icon(Icons.book),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final tblproses = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                _gagal(context, "No Resi tidak boleh kosong.");
              }); //ID gabole kosong
            } else {
              String resiku = controllerResi.text;
              launch(
                  'https://filipposkripsi.000webhostapp.com/laporan/tracking.php?resi=$resiku');
              //_prosestracking();
            }
          },
          color: Colors.green,
          child: const Text('Proses', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          const SizedBox(height: 20.0),
          logo,
          const SizedBox(height: 20.0),
          judul,
          const SizedBox(height: 8.0),
          noresi,
          const SizedBox(height: 24.0),
          Column(children: [
            tblproses,
          ]),
        ],
      ),
    );
  }
}
