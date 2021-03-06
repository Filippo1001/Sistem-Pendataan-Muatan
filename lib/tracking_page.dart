import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Tracking extends StatefulWidget {
  static String tag = 'tracking-page';

  const Tracking({Key? key}) : super(key: key);

  @override
  // final String text;
  // Home({Key key, @required this.text}) : super(key: key);
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  String message = "";
  String resi = "";
  bool error = false;
  var data;

  startSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      resi = pref.getString("resi")!;
    });
  }

  @override
  void initState() {
    startSession();
    super.initState();
  }

  String dataurl =
      "https://filipposkripsi.000webhostapp.com/pengiriman/gettracking.php";
  // do not use http://localhost/ for your local machine, Android emulation do not recognize localhost
  // insted use your local ip address or your live URL,
  // hit "ipconfig" on Windows or "ip a" on Linux to get IP Address

  Future<List> getData() async {
    var res = await http.post(Uri.parse(dataurl + "?resi=" + resi));
    //attache countryname on parameter country in url
    if (res.statusCode == 200) {
      setState(() {
        data = json.decode(res.body);
        if (data["error"]) {
          //check fi there is any error from server.
          error = true;
          message = data["errmsg"];
        }
      });
    } else {
      //there is error
      setState(() {
        error = true;
        message = "Error during fetching data";
      });
    }
    return json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resi),
        automaticallyImplyLeading: true,
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
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  const ItemList({Key? key, required this.list}) : super(key: key);

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
                  list[i]['kirim_tanggal'],
                  style: const TextStyle(fontFamily: "Netflix"),
                ),
                leading: const Icon(Icons.widgets),
                subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Tujuan : ${list[i]['kirim_tujuan']}"),
                      Text("Biaya : ${list[i]['kirim_biaya']}"),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
