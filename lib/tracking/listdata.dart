import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'adddata.dart';
import 'editdata.dart';

class TrackingPage extends StatefulWidget {
  static String tag = 'trackingpage-page';

  const TrackingPage({Key? key}) : super(key: key);
  @override
  // final String text;
  // Home({Key key, @required this.text}) : super(key: key);
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  Future<List> getData() async {
    final response = await http.get(
        Uri.parse(
            'https://filipposkripsi.000webhostapp.com/tracking/getdata.php'),
        headers: {"Access-Control-Allow-Origin": "*"});
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tracking Pengiriman",
          style: TextStyle(fontFamily: "Netflix"),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => AddData()));
        },
      ),

      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data ?? [],
                )
              : const Center(
                  child: CircularProgressIndicator(),
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
  const ItemList({Key? key, required this.list}) : super(key: key);

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
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            child: Card(
              child: ListTile(
                title: Text(
                  list[i]['kirim_resi'],
                  style: const TextStyle(fontFamily: "Netflix"),
                ),
                leading: const Icon(Icons.widgets),
                subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Tanggal : ${list[i]['tanggal']}"),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Status : ${list[i]['tracking']}"),
                      ),
                    ]),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      // button edit
                      IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        EditData(
                                          list: list,
                                          index: i,
                                        )));
                          }),
                      // button hapus
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          //membuat dialog konfirmasi hapus

                          var url =
                              "https://filipposkripsi.000webhostapp.com/tracking/deletedata.php";
                          http.post(Uri.parse(url),
                              body: {'id': list[i]['tracking_id']});

                          _deleteData(context, "Data berhasil dihapus");
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const TrackingPage();
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
