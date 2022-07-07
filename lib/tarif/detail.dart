import 'package:flutter/material.dart';
import 'editdata.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;
  const Detail({Key? key, required this.index, required this.list}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "https://filipposkripsi.000webhostapp.com/tarif/deletedata.php";
    http.post(Uri.parse(url),
        body: {'id': widget.list[widget.index]['tarif_id']});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Tarif();
    }));
    _deleteData(context, "Data berhasil dihapus");
  }

  void _deleteData(BuildContext context, String error) {
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
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "${widget.list[widget.index]['asal']}",
        style: const TextStyle(fontFamily: "Netflix"),
      )),
      body: Container(
        height: 370.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Text(
                  widget.list[widget.index]['asal'],
                  style: const TextStyle(fontFamily: "Netflix", fontSize: 20.0),
                ),
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: RaisedButton(
                        child: const Text(
                          "EDIT",
                          style: TextStyle(
                              fontFamily: "Netflix", color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: () => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: RaisedButton(
                        child: const Text(
                          "DELETE",
                          style: TextStyle(
                              fontFamily: "Netflix", color: Colors.white),
                        ),
                        color: Colors.red,
                        onPressed: () => deleteData(),
                      ),
                    ),
                  ],
                ),
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: double.infinity,
                  child: RaisedButton(
                    child: const Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Tarif();
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
