import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class LapMuatan extends StatefulWidget {
  @override
  static String tag = 'lapmuatan-page';
  _LapMuatanState createState() => _LapMuatanState();
}

class _LapMuatanState extends State {
  TextEditingController controllerAwal = new TextEditingController();
  TextEditingController controllerAkhir = new TextEditingController();

  var selectedDate = new DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    controllerAwal = new TextEditingController(text: selectedDate.toString());
    controllerAkhir = new TextEditingController(text: selectedDate.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final judul = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Berdasarkan Periode :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );

    final tgl1 = TextFormField(
      autofocus: true,
      controller: controllerAwal,
      decoration: new InputDecoration(
        hintText: "yyyy-mm-dd",
        labelText: "Tanggal Awal",
        icon: Icon(Icons.print),
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
    );

    final tgl2 = TextFormField(
      controller: controllerAkhir,
      decoration: new InputDecoration(
        hintText: "yyyy-mm-dd",
        labelText: "Tanggal Akhir",
        icon: Icon(Icons.print),
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
    );

    final tblprint = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 80.0,
          height: 50.0,
          onPressed: () {
            String awal = controllerAwal.text;
            String akhir = controllerAkhir.text;
            launch(
                'https://filipposkripsi.000webhostapp.com/laporan/print_muatan.php?awal=$awal&&akhir=$akhir');
          },
          color: Colors.green,
          child: Text('Print', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final tblbatal = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
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
      appBar: AppBar(title: Text('Laporan Muatan')),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          SizedBox(height: 20.0),
          judul,
          SizedBox(height: 8.0),
          tgl1,
          SizedBox(height: 8.0),
          tgl2,
          SizedBox(height: 24.0),
          tblprint,
          tblbatal,
        ],
      ),
    );
  }
}
