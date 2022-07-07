import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'lap_muatan.dart';
import 'lap_pengiriman.dart';
import 'profil_page.dart';
import 'tracking_page.dart';
import 'member_page.dart';
import 'about.dart';
import 'tracking/listdata.dart';
import 'customer/listdata.dart';
import 'tarif/listdata.dart';
import 'muatan/listdata.dart';
import 'pengguna/listdata.dart';
import 'pengiriman/listdata.dart';
import 'sopir/listdata.dart';
import 'SplashScreen_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(""),
    MemberPage.tag: (context) => MemberPage(),
    Tracking.tag: (context) => Tracking(),
    TrackingPage.tag: (context) => TrackingPage(),
    Pengguna.tag: (context) => Pengguna(),
    Tarif.tag: (context) => Tarif(),
    Sopir.tag: (context) => Sopir(),
    Muatan.tag: (context) => Muatan(),
    Kirim.tag: (context) => Kirim(),
    LapMuatan.tag: (context) => LapMuatan(),
    LapPengiriman.tag: (context) => LapPengiriman(),
    Profil.tag: (context) => Profil(),
    About.tag: (context) => About(),
    HomeCust.tag: (context) => HomeCust(),
  };

  // @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PT. HERRY PUTRA MANDIRI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: SplashScreenPage(),
      routes: routes,
    );
  }
}
