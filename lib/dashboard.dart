import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tracking/listdata.dart';
import 'customer/listdata.dart';
import 'tarif/listdata.dart';
import 'muatan/listdata.dart';
import 'pengguna/listdata.dart';
import 'pengiriman/listdata.dart';
import 'sopir/listdata.dart';
import 'lap_muatan.dart';
import 'lap_pengiriman.dart';

class Dashboard extends StatefulWidget {
  static String tag = 'dashboard-page';

  const Dashboard({Key? key}) : super(key: key);
  @override
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
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Selamat Datang, $nama',
        style: const TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xff329cef),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            welcome,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //ROW 1
              children: [
                Container(
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
                      'Customer',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
                      'Sopir',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
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
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
                      'Muatan',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
                      'Pengiriman',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
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
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
                      'Lap Muatan',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
                      'Lap Pengiriman',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
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
