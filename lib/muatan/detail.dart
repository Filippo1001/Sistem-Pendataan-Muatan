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
        "${widget.list[widget.index]['muatan_nama']}",
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
                    "No. Nota : ${widget.list[widget.index]['muatan_nota']}",
                    style: new TextStyle(fontFamily: "Netflix", fontSize: 20.0),
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
                    "Tanggal Muatan : ${widget.list[widget.index]['muatan_tgl']}",
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
                    "Berat : ${widget.list[widget.index]['berat']} kg",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Customer : ${widget.list[widget.index]['cust_nama']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
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
                        return Muatan();
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
