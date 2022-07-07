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
  void deleteData() {
    var url =
        "https://filipposkripsi.000webhostapp.com/tracking/deletedata.php";
    http.post(Uri.parse(url),
        body: {'barang_id': widget.list[widget.index]['barang_id']});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return TrackingPage();
    }));
    _DeleteData(context, "Data berhasil dihapus");
  }

  void _DeleteData(BuildContext context, String error) {
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
        "${widget.list[widget.index]['barang_nama']}",
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
                    widget.list[widget.index]['barang_nama'],
                    style: new TextStyle(fontFamily: "Netflix", fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Berat : ${widget.list[widget.index]['barang_berat']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Satuan : ${widget.list[widget.index]['barang_satuan']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Kategori : ${widget.list[widget.index]['kategori_nama']}",
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
                        return TrackingPage();
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
