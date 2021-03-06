import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Detail.dart';
import 'adddata.dart';
import 'editdata.dart';
import 'package:pengiriman/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Kirim extends StatefulWidget {
  static String tag = 'kirim-page';
  @override
  // final String text;
  // Home({Key key, @required this.text}) : super(key: key);
  _KirimState createState() => new _KirimState();
}

class _KirimState extends State<Kirim> {
  Future<List> getData() async {
    final response = await http.get(
        Uri.parse(
            'https://filipposkripsi.000webhostapp.com/pengiriman/getdata.php'),
        headers: {"Access-Control-Allow-Origin": "*"});
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Daftar Pengiriman",
          style: TextStyle(fontFamily: "Netflix"),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => new AddData()));
        },
      ),

      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data ?? [],
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),

      // body: new FutureBuilder<List>(
      //   future: getData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) print(snapshot.error);

      //     return snapshot.hasData
      //         ? new ItemList(
      //             list: snapshot.data,
      //           )
      //         : new Center(
      //             child: new CircularProgressIndicator(),
      //           );
      //   },
      // ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

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
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['kirim_resi'],
                  style: TextStyle(fontFamily: "Netflix"),
                ),
                leading: new Icon(Icons.widgets),
                subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(list[i]['sopir_nama']),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "Pengiriman dari : ${list[i]['kirim_asal']} - ${list[i]['kirim_tujuan']}"),
                      ),
                    ]),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      // button resi
                      IconButton(
                          icon: Icon(Icons.print),
                          onPressed: () {
                            String resiku = list[i]['kirim_resi'];
                            launch(
                                'https://filipposkripsi.000webhostapp.com/laporan/print_nota.php?resi=$resiku');
                          }),
                      IconButton(
                          icon: Icon(Icons.details),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Detail(
                                          list: list,
                                          index: i,
                                        )));
                          }),
                      // button hapus
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          //membuat dialog konfirmasi hapus

                          var url =
                              "https://filipposkripsi.000webhostapp.com/pengiriman/deletedata.php";
                          http.post(Uri.parse(url),
                              body: {'id': list[i]['kirim_id']});

                          _DeleteData(context, "Data berhasil dihapus");
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Kirim();
                          }));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
