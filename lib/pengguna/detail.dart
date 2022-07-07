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
        "https://filipposkripsi.000webhostapp.com/pengguna/deletedata.php";
    http.post(Uri.parse(url),
        body: {'user_id': widget.list[widget.index]['user_id']});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Pengguna();
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
        "${widget.list[widget.index]['user_nama']}",
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
                    "Nama Pengguna : ${widget.list[widget.index]['user_nama']}",
                    style: new TextStyle(fontFamily: "Netflix", fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Username : ${widget.list[widget.index]['user_username']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Level : ${widget.list[widget.index]['user_level']}",
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
                        return Pengguna();
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
