import 'package:flutter/material.dart';
import 'editdata.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.index, required this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
        "${widget.list[widget.index]['kirim_resi']}",
        style: TextStyle(fontFamily: "Netflix"),
      )),
      body: new Container(
        height: 370.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "No. Resi : ${widget.list[widget.index]['kirim_resi']}",
                    style: new TextStyle(fontFamily: "Netflix", fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tanggal Kirim : ${widget.list[widget.index]['kirim_tanggal']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tanggal Estimasi : ${widget.list[widget.index]['kirim_estimasi']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tujuan : ${widget.list[widget.index]['kirim_asal']} - ${widget.list[widget.index]['kirim_tujuan']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sopir : ${widget.list[widget.index]['sopir_nama']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Nama Muatan : ${widget.list[widget.index]['muatan_nama']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Detail Barang : ${widget.list[widget.index]['detbarang']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Berat : ${widget.list[widget.index]['berat']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tarif : ${widget.list[widget.index]['tarif']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Biaya Kirim: ${widget.list[widget.index]['kirim_biaya']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 8.0),

                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),

                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
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
          ),
        ),
      ),
    );
  }
}
