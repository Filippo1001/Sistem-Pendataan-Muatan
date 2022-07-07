import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerTgl = new TextEditingController();
  TextEditingController controllerTrack = new TextEditingController();
  String _valStatus = "Pilih Status Tracking";
  void editData() {
    var url = "https://filipposkripsi.000webhostapp.com/tracking/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['tracking_id'],
      "tgl": controllerTgl.text,
      "tracking": _valStatus,
    });
  }

  @override
  void initState() {
    controllerTgl =
        new TextEditingController(text: widget.list[widget.index]['tanggal']);
    _valStatus = widget.list[widget.index]['tracking'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Edit Data - ${widget.list[widget.index]['kirim_resi']}",
          style: TextStyle(fontFamily: "Netflix"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerTgl,
                  decoration: new InputDecoration(
                    hintText: "yyyy-mm-dd",
                    labelText: "Tanggal Kirim",
                    icon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new DropdownButton<String>(
                  hint: Text(_valStatus),
                  isExpanded: true,
                  items: <String>[
                    'Sedang dalam perjalanan.',
                    'Sedang Transit di Pekalongan.',
                    'Sudah sampai di Kota tujuan.',
                    'Menuju ke alamat penerima.',
                    'Ada kendala kecelakaan memerlukan waktu tambahan.'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _valStatus = value.toString();
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: new Text(
                      "SIMPAN DATA",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editData();
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new TrackingPage()));
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      "Kembali",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    color: Colors.red,
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
          ],
        ),
      ),
    );
  }
}
