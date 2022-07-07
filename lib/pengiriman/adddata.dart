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
  TextEditingController controllerEstimasi = new TextEditingController();

  var selectedDate = new DateFormat('yyyy-MM-dd').format(DateTime.now());
  String _valMuatan = "Pilih Muatan";
  String _valAsal = "Pilih Asal Pengiriman";
  String _valTujuan = "Pilih Tujuan Pengiriman";
  String _valSopir = "Pilih Sopir";

  List<dynamic> _dataMuatan = [];
  void getMuatan() async {
    final respose = await http.get(
        Uri.parse(
            'https://filipposkripsi.000webhostapp.com/muatan/getdata.php'),
        headers: {
          "Access-Control-Allow-Origin": "*"
        }); //untuk melakukan request ke webservice
    var listDataMuatan =
        jsonDecode(respose.body); //lalu kita decode hasil datanya
    setState(() {
      _dataMuatan =
          listDataMuatan; // dan kita set kedalam variable _dataProvince
    });
    print("data : $listDataMuatan");
  }

  List<dynamic> _dataSopir = [];
  void getSopir() async {
    final respose = await http.get(
        Uri.parse('https://filipposkripsi.000webhostapp.com/sopir/getdata.php'),
        headers: {
          "Access-Control-Allow-Origin": "*"
        }); //untuk melakukan request ke webservice
    var listDataSopir =
        jsonDecode(respose.body); //lalu kita decode hasil datanya
    setState(() {
      _dataSopir = listDataSopir; // dan kita set kedalam variable _dataProvince
    });
    print("data : $listDataSopir");
  }

  List<dynamic> _dataAsal = [];
  void getAsal() async {
    final respose = await http.get(
        Uri.parse('https://filipposkripsi.000webhostapp.com/tarif/getasal.php'),
        headers: {
          "Access-Control-Allow-Origin": "*"
        }); //untuk melakukan request ke webservice
    var listDataAsal =
        jsonDecode(respose.body); //lalu kita decode hasil datanya
    setState(() {
      _dataAsal = listDataAsal; // dan kita set kedalam variable _dataProvince
    });
    print("data : $listDataAsal");
  }

  List<dynamic> _dataTujuan = [];
  void getTujuan() async {
    final respose = await http.get(
        Uri.parse(
            'https://filipposkripsi.000webhostapp.com/tarif/gettujuan.php'),
        headers: {
          "Access-Control-Allow-Origin": "*"
        }); //untuk melakukan request ke webservice
    var listDataTujuan =
        jsonDecode(respose.body); //lalu kita decode hasil datanya
    setState(() {
      _dataTujuan =
          listDataTujuan; // dan kita set kedalam variable _dataProvince
    });
    print("data : $listDataTujuan");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMuatan();
    getSopir();
    getAsal();
    getTujuan(); //Ketika pertama kali membuka home screen makan method ini dijalankan untuk pertama kalinya juga
    controllerTgl = new TextEditingController(text: selectedDate.toString());
    controllerEstimasi =
        new TextEditingController(text: selectedDate.toString());
  }

  void addData() {
    var url = "https://filipposkripsi.000webhostapp.com/pengiriman/adddata.php";

    http.post(Uri.parse(url), body: {
      "tgl": controllerTgl.text,
      "estimasi": controllerEstimasi.text,
      "asal": _valAsal,
      "tujuan": _valTujuan,
      "namamuatan": _valMuatan,
      "namasopir": _valSopir
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
                new TextField(
                  controller: controllerEstimasi,
                  decoration: new InputDecoration(
                    hintText: "yyyy-mm-dd",
                    labelText: "Tanggal Estimasi",
                    icon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                DropdownButton(
                  hint: Text(_valAsal),
                  isExpanded: true,
                  items: _dataAsal.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['asal']),
                      value: item['asal'],
                    );
                  }).toList(),
                  onChanged: (newvalueAs) {
                    setState(() {
                      _valAsal = newvalueAs.toString();
                    });
                  },
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(height: 8.0),
                DropdownButton(
                  hint: Text(_valTujuan),
                  isExpanded: true,
                  items: _dataTujuan.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['tujuan']),
                      value: item['tujuan'],
                    );
                  }).toList(),
                  onChanged: (newValuetj) {
                    setState(() {
                      _valTujuan = newValuetj.toString();
                    });
                  },
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(height: 8.0),
                DropdownButton(
                  hint: Text(_valMuatan),
                  isExpanded: true,
                  items: _dataMuatan.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                          "${item['muatan_nama']} - ${item['cust_nama']} - ${item['muatan_tgl']}"),
                      value: item['muatan_nama'],
                    );
                  }).toList(),
                  onChanged: (newValuemt) {
                    setState(() {
                      _valMuatan = newValuemt.toString();
                    });
                  },
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(height: 8.0),
                DropdownButton(
                  hint: Text(_valSopir),
                  isExpanded: true,
                  items: _dataSopir.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['sopir_nama']),
                      value: item['sopir_nama'],
                    );
                  }).toList(),
                  onChanged: (newValuespr) {
                    setState(() {
                      _valSopir = newValuespr.toString();
                    });
                  },
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
                            if (controllerEstimasi.value.text.isEmpty) {
                              setState(() {
                                error(context,
                                    "Tanggal Estimasi tidak boleh kosong");
                                error(context, "Isi data dengan benar!");
                              }); //nama ga bole kosong
                            } else {
                              addData();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Kirim();
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
                            return Kirim();
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
