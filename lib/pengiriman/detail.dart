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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "${widget.list[widget.index]['kirim_resi']}",
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "No. Resi : ${widget.list[widget.index]['kirim_resi']}",
                    style: const TextStyle(fontFamily: "Netflix", fontSize: 20.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tanggal Kirim : ${widget.list[widget.index]['kirim_tanggal']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tanggal Estimasi : ${widget.list[widget.index]['kirim_estimasi']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tujuan : ${widget.list[widget.index]['kirim_asal']} - ${widget.list[widget.index]['kirim_tujuan']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sopir : ${widget.list[widget.index]['sopir_nama']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Nama Muatan : ${widget.list[widget.index]['muatan_nama']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Detail Barang : ${widget.list[widget.index]['detbarang']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Berat : ${widget.list[widget.index]['berat']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tarif : ${widget.list[widget.index]['tarif']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Biaya Kirim: ${widget.list[widget.index]['kirim_biaya']}",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 8.0),

                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),

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
