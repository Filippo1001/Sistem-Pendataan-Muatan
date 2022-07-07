import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  const EditData({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerAsal = TextEditingController();
  TextEditingController controllerTujuan = TextEditingController();
  TextEditingController controllerTarif = TextEditingController();

  void editData() {
    var url = "https://filipposkripsi.000webhostapp.com/tarif/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['tarif_id'],
      "asal": controllerAsal.text,
      "tujuan": controllerTujuan.text,
      "tarif": controllerTarif.text
    });
  }

  @override
  void initState() {
    controllerAsal =
        TextEditingController(text: widget.list[widget.index]['asal']);
    controllerTujuan =
        TextEditingController(text: widget.list[widget.index]['tujuan']);
    controllerTarif =
        TextEditingController(text: widget.list[widget.index]['tarif']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Data",
          style: TextStyle(fontFamily: "Netflix"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerAsal,
                  decoration: InputDecoration(
                    hintText: "Asal Kirim",
                    labelText: "Asal Kirim",
                    icon: const Icon(Icons.location_city),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerTujuan,
                  decoration: InputDecoration(
                    hintText: "Tujuan Kirim",
                    labelText: "Tujuan Kirim",
                    icon: const Icon(Icons.location_city),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerTarif,
                  decoration: InputDecoration(
                    hintText: "Biaya Kirim",
                    labelText: "Biaya Kirim",
                    icon: const Icon(Icons.money),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                RaisedButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                        fontFamily: "Netflix", color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Tarif()));
                  },
                ),
                RaisedButton(
                  child: const Text(
                    "Kembali",
                    style: TextStyle(
                        fontFamily: "Netflix", color: Colors.white),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Tarif();
                    }));
                  },
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
