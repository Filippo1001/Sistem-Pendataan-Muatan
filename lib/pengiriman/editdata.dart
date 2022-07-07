import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerResi = new TextEditingController();
  TextEditingController controllerTgl = new TextEditingController();
  TextEditingController controllerEstimasi = new TextEditingController();
  TextEditingController controllerTujuan = new TextEditingController();
  TextEditingController controllerBiaya = new TextEditingController();

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
    controllerResi = new TextEditingController(
        text: widget.list[widget.index]['kirim_resi']);
    controllerTgl = new TextEditingController(
        text: widget.list[widget.index]['kirim_tanggal']);
    controllerEstimasi = new TextEditingController(
        text: widget.list[widget.index]['kirim_estimasi']);
    controllerTujuan = new TextEditingController(
        text: widget.list[widget.index]['kirim_tujuan']);
    controllerBiaya = new TextEditingController(
        text: widget.list[widget.index]['kirim_biaya']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Edit Data",
          style: TextStyle(fontFamily: "Netflix"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerResi,
                  decoration: new InputDecoration(
                    hintText: "Nomor Resi Pengiriman",
                    labelText: "Nomor Resi Pengiriman",
                    icon: Icon(Icons.book),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerTgl,
                  decoration: new InputDecoration(
                    hintText: "yyyy-mm-dd",
                    labelText: "Tanggal Kirim",
                    icon: Icon(Icons.input),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerEstimasi,
                  decoration: new InputDecoration(
                    hintText: "yyyy-mm-dd",
                    labelText: "Tanggal Estimasi",
                    icon: Icon(Icons.input),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerTujuan,
                  decoration: new InputDecoration(
                    hintText: "Tujuan Pengiriman",
                    labelText: "Tujuan Pengiriman",
                    icon: Icon(Icons.input),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerBiaya,
                  decoration: new InputDecoration(
                    hintText: "Biaya Kirim",
                    labelText: "Biaya Kirim",
                    icon: Icon(Icons.input),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: new Text(
                      "SIMPAN DATA",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editData();
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              builder: (BuildContext context) => new Kirim()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: Text(
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
