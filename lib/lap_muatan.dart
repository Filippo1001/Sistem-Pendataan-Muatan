import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class LapMuatan extends StatefulWidget {
  static String tag = 'lapmuatan-page';

  const LapMuatan({Key? key}) : super(key: key);
  @override
  _LapMuatanState createState() => _LapMuatanState();
}

class _LapMuatanState extends State {
  TextEditingController controllerAwal = TextEditingController();
  TextEditingController controllerAkhir = TextEditingController();

  var selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    controllerAwal = TextEditingController(text: selectedDate.toString());
    controllerAkhir = TextEditingController(text: selectedDate.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const judul = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Berdasarkan Periode :',
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );

    final tgl1 = TextFormField(
      autofocus: true,
      controller: controllerAwal,
      decoration: InputDecoration(
        hintText: "yyyy-mm-dd",
        labelText: "Tanggal Awal",
        icon: const Icon(Icons.print),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final tgl2 = TextFormField(
      controller: controllerAkhir,
      decoration: InputDecoration(
        hintText: "yyyy-mm-dd",
        labelText: "Tanggal Akhir",
        icon: const Icon(Icons.print),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );

    final tblprint = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
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
          child: const Text('Print', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final tblbatal = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
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
      appBar: AppBar(title: const Text('Laporan Muatan')),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          const SizedBox(height: 20.0),
          judul,
          const SizedBox(height: 8.0),
          tgl1,
          const SizedBox(height: 8.0),
          tgl2,
          const SizedBox(height: 24.0),
          tblprint,
          tblbatal,
        ],
      ),
    );
  }
}
