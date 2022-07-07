import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  const EditData({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerResi = TextEditingController();
  TextEditingController controllerTgl = TextEditingController();
  TextEditingController controllerEstimasi = TextEditingController();
  TextEditingController controllerTujuan = TextEditingController();
  TextEditingController controllerBiaya = TextEditingController();

  void editData() {
    var url =
        "https://filipposkripsi.000webhostapp.com/pengiriman/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['kirim_id'],
      "resi": controllerResi.text,
      "tgl": controllerTgl.text,
      "estimasi": controllerEstimasi.text,
      "tujuan": controllerTujuan.text,
      "biaya": controllerBiaya.text
    });
  }

  @override
  void initState() {
    controllerResi = TextEditingController(
        text: widget.list[widget.index]['kirim_resi']);
    controllerTgl = TextEditingController(
        text: widget.list[widget.index]['kirim_tanggal']);
    controllerEstimasi = TextEditingController(
        text: widget.list[widget.index]['kirim_estimasi']);
    controllerTujuan = TextEditingController(
        text: widget.list[widget.index]['kirim_tujuan']);
    controllerBiaya = TextEditingController(
        text: widget.list[widget.index]['kirim_biaya']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Data",
          style: TextStyle(fontFamily: "Netflix"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerResi,
                  decoration: InputDecoration(
                    hintText: "Nomor Resi Pengiriman",
                    labelText: "Nomor Resi Pengiriman",
                    icon: const Icon(Icons.book),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerTgl,
                  decoration: InputDecoration(
                    hintText: "yyyy-mm-dd",
                    labelText: "Tanggal Kirim",
                    icon: const Icon(Icons.input),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerEstimasi,
                  decoration: InputDecoration(
                    hintText: "yyyy-mm-dd",
                    labelText: "Tanggal Estimasi",
                    icon: const Icon(Icons.input),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerTujuan,
                  decoration: InputDecoration(
                    hintText: "Tujuan Pengiriman",
                    labelText: "Tujuan Pengiriman",
                    icon: const Icon(Icons.input),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerBiaya,
                  decoration: InputDecoration(
                    hintText: "Biaya Kirim",
                    labelText: "Biaya Kirim",
                    icon: const Icon(Icons.input),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: const Text(
                      "SIMPAN DATA",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editData();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => Kirim()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: const Text(
                      "Kembali",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Kirim();
                      }));
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
