import 'package:flutter/material.dart';

class About extends StatelessWidget {
  static String tag = 'about-page';
  @override
  Widget build(BuildContext context) {
    final logo = Center(
      child: Image.asset(
        "assets/images/foto.png",
        width: 250.0,
        height: 350.0,
      ),
    );

    final nama = Center(
      child: Text(
        'FILIPPO CHRISTO YURO RAMANDYTA',
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );

    final alamat = Center(
      child: Text(
        'Perumahan Graha Mulia Blok A No. 10 Pekalongan',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );

    final email = Center(
      child: Text(
        'email : filippochristo9@gmail.com',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );

    final telp = Center(
      child: Text(
        'Phone : 088708877788',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );

    final copyright = Center(
      child: Text(
        'Copyright 2022 - PT. HERRY PUTRA MANDIRI',
        style: TextStyle(fontSize: 15.0, color: Colors.black),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xff329cef),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 10.0),
            nama,
            alamat,
            email,
            telp,
            SizedBox(height: 50.0),
            copyright
          ],
        ),
      ),
    );
  }
}
