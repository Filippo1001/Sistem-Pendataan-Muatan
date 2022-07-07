import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  static String tag = 'profil-page';
  @override
  Widget build(BuildContext context) {
    final nama = TextFormField(
      autofocus: true,
      decoration: new InputDecoration(
        hintText: "Nama Lengkap",
        labelText: "Nama Lengkap",
        icon: Icon(Icons.people),
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
    );

    final alamat = TextFormField(
      autofocus: true,
      decoration: new InputDecoration(
        hintText: "Alamat",
        labelText: "Alamat",
        icon: Icon(Icons.home),
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
    );

    final telepon = TextFormField(
      autofocus: true,
      decoration: new InputDecoration(
        hintText: "Nomor Telepon",
        labelText: "Nomor Telepon",
        icon: Icon(Icons.phone),
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
    );

    final tblsimpan = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 80.0,
          height: 50.0,
          onPressed: () {},
          color: Colors.green,
          child: Text('Simpan', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final tblbatal = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 80.0,
          height: 50.0,
          onPressed: () {},
          color: Colors.red,
          child: Text('Batal', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Profil Saya')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            nama,
            SizedBox(height: 8.0),
            alamat,
            SizedBox(height: 8.0),
            telepon,
            SizedBox(height: 24.0),
            tblsimpan,
            tblbatal,
          ],
        ),
      ),
    );
  }
}
