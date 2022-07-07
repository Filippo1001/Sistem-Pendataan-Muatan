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
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerBerat = new TextEditingController();
  TextEditingController controllerSatuan = new TextEditingController();
  TextEditingController controllerIdKat = new TextEditingController();

  void editData() {
    var url = "https://filipposkripsi.000webhostapp.com/customer/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['cust_id'],
      "nama": controllerNama.text,
      "berat": controllerBerat.text,
      "satuan": controllerSatuan.text,
      "idkat": controllerIdKat.text
    });
  }

  @override
  void initState() {
    controllerNama = new TextEditingController(
        text: widget.list[widget.index]['barang_nama']);
    controllerBerat = new TextEditingController(
        text: widget.list[widget.index]['barang_berat']);
    controllerSatuan = new TextEditingController(
        text: widget.list[widget.index]['barang_satuan']);
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
                  controller: controllerNama,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Nama Barang", labelText: "Nama Barang"),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerBerat,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Berat", labelText: "Berat"),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerSatuan,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Satuan", labelText: "Satuan"),
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
                              builder: (BuildContext context) => new Muatan()));
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
                        return Muatan();
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
