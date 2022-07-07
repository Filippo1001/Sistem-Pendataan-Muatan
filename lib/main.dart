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
    HomePage.tag: (context) => const HomePage(""),
    MemberPage.tag: (context) => const MemberPage(),
    Tracking.tag: (context) => const Tracking(),
    TrackingPage.tag: (context) => const TrackingPage(),
    Pengguna.tag: (context) => const Pengguna(),
    Tarif.tag: (context) => const Tarif(),
    Sopir.tag: (context) => Sopir(),
    Muatan.tag: (context) => const Muatan(),
    Kirim.tag: (context) => Kirim(),
    LapMuatan.tag: (context) => const LapMuatan(),
    LapPengiriman.tag: (context) => const LapPengiriman(),
    Profil.tag: (context) => const Profil(),
    About.tag: (context) => const About(),
    HomeCust.tag: (context) => const HomeCust(),
  };

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PT. HERRY PUTRA MANDIRI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: const SplashScreenPage(),
      routes: routes,
    );
  }
}
