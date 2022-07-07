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
  TextEditingController controllerTgl = new TextEditingController();

  var selectedDate =
      new DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
  String _valKirim = "Pilih Pengiriman";
  String _valStatus = "Pilih Status Tracking";
  List<dynamic> _dataKirim = [];
  void getKirim() async {
    final respose = await http.get(
        Uri.parse(
            'https://filipposkripsi.000webhostapp.com/pengiriman/getdata.php'),
        headers: {
          "Access-Control-Allow-Origin": "*"
        }); //untuk melakukan request ke webservice
    var listData = jsonDecode(respose.body); //lalu kita decode hasil datanya
    setState(() {
      _dataKirim = listData; // dan kita set kedalam variable _dataProvince
    });
    print("data : $listData");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKirim(); //Ketika pertama kali
    controllerTgl = new TextEditingController(text: selectedDate.toString());
  }

  void addData() {
    var url = "https://filipposkripsi.000webhostapp.com/tracking/adddata.php";

    http.post(Uri.parse(url), body: {
      "tgl": controllerTgl.text,
      "tracking": _valStatus,
      "kirim_resi": _valKirim
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
                DropdownButton(
                  hint: Text(_valKirim),
                  isExpanded: true,
                  items: _dataKirim.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                          "${item['kirim_resi']} - ${item['cust_nama']} - ${item['kirim_tanggal']} "),
                      value: item['kirim_resi'],
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _valKirim = newValue.toString();
                    });
                  },
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerTgl,
                  decoration: new InputDecoration(
                    hintText: "yyyy-mm-dd",
                    labelText: "Tanggal Kirim",
                    icon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new DropdownButton<String>(
                  hint: Text(_valStatus),
                  isExpanded: true,
                  items: <String>[
                    'Sedang dalam perjalanan.',
                    'Sedang Transit di Pekalongan.',
                    'Sudah sampai di Kota tujuan.',
                    'Menuju ke alamat penerima.',
                    'Ada kendala kecelakaan memerlukan waktu tambahan.'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _valStatus = value.toString();
                    });
                  },
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
                            if (controllerTgl.value.text.isEmpty) {
                              setState(() {
                                error(context, "Tanggal tidak boleh kosong");
                              }); //ID gabole kosong
                            } else {
                              addData();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return TrackingPage();
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
                            return TrackingPage();
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
