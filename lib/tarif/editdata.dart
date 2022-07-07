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
  TextEditingController controllerAsal = new TextEditingController();
  TextEditingController controllerTujuan = new TextEditingController();
  TextEditingController controllerTarif = new TextEditingController();

  void editData() {
    var url = "https://filipposkripsi.000webhostapp.com/tarif/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['tarif_id'],
      "asal": controllerAsal.text,
      "tujuan": controllerTujuan.text,
      "tarif": controllerTarif.text
    });
  }

  @override
  void initState() {
    controllerAsal =
        new TextEditingController(text: widget.list[widget.index]['asal']);
    controllerTujuan =
        new TextEditingController(text: widget.list[widget.index]['tujuan']);
    controllerTarif =
        new TextEditingController(text: widget.list[widget.index]['tarif']);
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
                  controller: controllerAsal,
                  decoration: new InputDecoration(
                    hintText: "Asal Kirim",
                    labelText: "Asal Kirim",
                    icon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerTujuan,
                  decoration: new InputDecoration(
                    hintText: "Tujuan Kirim",
                    labelText: "Tujuan Kirim",
                    icon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerTarif,
                  decoration: new InputDecoration(
                    hintText: "Biaya Kirim",
                    labelText: "Biaya Kirim",
                    icon: Icon(Icons.money),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                    child: Row(
                  children: [
                    RaisedButton(
                      child: new Text(
                        "Simpan",
                        style: TextStyle(
                            fontFamily: "Netflix", color: Colors.white),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        editData();
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Tarif()));
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        "Kembali",
                        style: TextStyle(
                            fontFamily: "Netflix", color: Colors.white),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Tarif();
                        }));
                      },
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
