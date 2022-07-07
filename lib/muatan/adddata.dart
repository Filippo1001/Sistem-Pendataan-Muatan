import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerTgl = new TextEditingController();
  TextEditingController controllerBarang = new TextEditingController();
  TextEditingController controllerBerat = new TextEditingController();
  var selectedDate = new DateFormat('yyyy-MM-dd').format(DateTime.now());
  String _valCust = "Pilih Customer";
  List<dynamic> _dataCust = [];
  void getCust() async {
    final respose = await http.get(
        Uri.parse(
            'https://filipposkripsi.000webhostapp.com/customer/getdata.php'),
        headers: {
          "Access-Control-Allow-Origin": "*"
        }); //untuk melakukan request ke webservice
    var listData = jsonDecode(respose.body); //lalu kita decode hasil datanya
    setState(() {
      _dataCust = listData; // dan kita set kedalam variable _dataProvince
    });
    print("data : $listData");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCust(); //Ketika pertama kali membuka home screen makan method ini dijalankan untuk pertama kalinya juga
    controllerTgl = new TextEditingController(text: selectedDate.toString());
  }

  void addData() {
    var url = "https://filipposkripsi.000webhostapp.com/muatan/adddata.php";

    http.post(Uri.parse(url), body: {
      "nama": controllerNama.text,
      "tgl": controllerTgl.text,
      "detbarang": controllerBarang.text,
      "berat": controllerBerat.text,
      "namacust": _valCust
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
                  controller: controllerTgl,
                  decoration: new InputDecoration(
                    hintText: "yyyy-mm-dd",
                    labelText: "Tanggal Muatan",
                    icon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama Muatan",
                    labelText: "Nama Muatan",
                    icon: Icon(Icons.add_box),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerBarang,
                  decoration: new InputDecoration(
                    hintText: "Detail Barang",
                    labelText: "Detail Barang",
                    icon: Icon(Icons.widgets),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerBerat,
                  decoration: new InputDecoration(
                    hintText: "Berat Barang (Kg)",
                    labelText: "Berat Barang (Kg)",
                    icon: Icon(Icons.monitor_weight),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                DecoratedBox(
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: BorderRadius.circular(5.0),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: DropdownButton(
                    hint: Text(_valCust),
                    isExpanded: true,
                    underline: Container(),
                    items: _dataCust.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['cust_nama']),
                        value: item['cust_nama'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valCust = value.toString();
                      });
                    },
                  ),
                ),
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
                            if (controllerNama.value.text.isEmpty) {
                              setState(() {
                                error(
                                    context, "Nama Muatan tidak boleh kosong");
                              }); //ID gabole kosong
                            } else {
                              addData();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Muatan();
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
                            return Muatan();
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
