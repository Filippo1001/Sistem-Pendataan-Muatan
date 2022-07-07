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
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerLevel = new TextEditingController();

  void editData() {
    var url = "https://filipposkripsi.000webhostapp.com/pengguna/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['user_id'],
      "nama": controllerNama.text,
      "username": controllerUsername.text,
      "password": controllerPassword.text
    });
  }

  @override
  void initState() {
    controllerNama =
        new TextEditingController(text: widget.list[widget.index]['user_nama']);
    controllerUsername = new TextEditingController(
        text: widget.list[widget.index]['user_username']);
    controllerPassword = new TextEditingController(
        text: widget.list[widget.index]['user_password']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Edit Data",
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
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama Pengguna",
                    labelText: "Nama Pengguna",
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerUsername,
                  decoration: new InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    icon: Icon(Icons.person_add),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 8.0),
                new TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
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
                                  new Pengguna()));
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
                        return Pengguna();
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
