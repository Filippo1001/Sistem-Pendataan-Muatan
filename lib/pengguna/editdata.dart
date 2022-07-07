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
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerLevel = TextEditingController();

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
        TextEditingController(text: widget.list[widget.index]['user_nama']);
    controllerUsername = TextEditingController(
        text: widget.list[widget.index]['user_username']);
    controllerPassword = TextEditingController(
        text: widget.list[widget.index]['user_password']);
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
                  controller: controllerNama,
                  decoration: InputDecoration(
                    hintText: "Nama Pengguna",
                    labelText: "Nama Pengguna",
                    icon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerUsername,
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    icon: const Icon(Icons.person_add),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    icon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: const Text(
                      "SIMPAN DATA",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editData();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Pengguna()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: const Text(
                      "Kembali",
                      style:
                          const TextStyle(fontFamily: "Netflix", color: Colors.white),
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
