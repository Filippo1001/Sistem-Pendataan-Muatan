import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';
import 'dart:async';
import 'dart:convert';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerAsal = new TextEditingController();
  TextEditingController controllerTujuan = new TextEditingController();
  TextEditingController controllerTarif = new TextEditingController();

  void addData() {
    var url = "https://filipposkripsi.000webhostapp.com/tarif/adddata.php";

    http.post(Uri.parse(url), body: {
      "asal": controllerAsal.text,
      "tujuan": controllerTujuan.text,
      "tarif": controllerTarif.text
    });
  }

  void error(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Tambah Data",
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
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                          onPressed: () {
                            if (controllerAsal.value.text.isEmpty) {
                              setState(() {
                                error(context, "Asal Kirim tidak boleh kosong");
                              }); //ID gabole kosong
                            } else if (controllerTujuan.value.text.isEmpty) {
                              setState(() {
                                error(
                                    context, "Tujuan Kirim tidak boleh kosong");
                              }); //ID gabole kosong
                            } else if (controllerTarif.value.text.isEmpty) {
                              setState(() {
                                error(
                                    context, "Biaya Kirim tidak boleh kosong");
                              }); //ID gabole kosong
                            } else {
                              addData();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Tarif();
                              }));
                            }

                            // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                            //     builder: (BuildContext context) => new Home()));
                          },
                          child: new Text(
                            "Simpan Data",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.green),
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Tarif();
                          }));
                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          //     builder: (BuildContext context) => new Home()));
                        },
                        child: new Text(
                          "Kembali",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
