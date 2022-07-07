import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  static String tag = 'profil-page';

  const Profil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final nama = TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Nama Lengkap",
        labelText: "Nama Lengkap",
        icon: const Icon(Icons.people),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final alamat = TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Alamat",
        labelText: "Alamat",
        icon: const Icon(Icons.home),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final telepon = TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Nomor Telepon",
        labelText: "Nomor Telepon",
        icon: const Icon(Icons.phone),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final tblsimpan = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 80.0,
          height: 50.0,
          onPressed: () {},
          color: Colors.green,
          child: const Text('Simpan', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final tblbatal = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 80.0,
          height: 50.0,
          onPressed: () {},
          color: Colors.red,
          child: const Text('Batal', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            const SizedBox(height: 20.0),
            nama,
            const SizedBox(height: 8.0),
            alamat,
            const SizedBox(height: 8.0),
            telepon,
            const SizedBox(height: 24.0),
            tblsimpan,
            tblbatal,
          ],
        ),
      ),
    );
  }
}
