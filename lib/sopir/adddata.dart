import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerNotelp = TextEditingController();

  void addData() {
    var url = "https://filipposkripsi.000webhostapp.com/sopir/adddata.php";

    http.post(Uri.parse(url), body: {
      "nama": controllerNama.text,
      "alamat": controllerAlamat.text,
      "notelp": controllerNotelp.text
    });
  }

  void error(BuildContext context, String error) {
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
        title: const Text(
          "Tambah Data",
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
                    hintText: "Nama Sopir",
                    labelText: "Nama Sopir",
                    icon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerAlamat,
                  decoration: InputDecoration(
                    hintText: "Alamat",
                    labelText: "Alamat",
                    icon: const Icon(Icons.home),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: controllerNotelp,
                  decoration: InputDecoration(
                    hintText: "No Telepon",
                    labelText: "No Telepon",
                    icon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                          onPressed: () {
                            if (controllerNama.value.text.isEmpty) {
                              setState(() {
                                error(context, "Nama Sopir tidak boleh kosong");
                              }); //ID gabole kosong
                            } else if (controllerAlamat.value.text.isEmpty) {
                              setState(() {
                                error(context, "Alamat tidak boleh kosong");
                                error(context, "Isi data dengan benar!");
                              }); //nama ga bole kosong
                            } else if (controllerNotelp.value.text.isEmpty) {
                              setState(() {
                                error(context, "No Telepon tidak boleh kosong");
                                error(context, "Isi data dengan benar!");
                              }); //harga gabole kosong
                            } else {
                              addData();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Sopir();
                              }));
                            }

                            // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                            //     builder: (BuildContext context) => new Home()));
                          },
                          child: const Text(
                            "Simpan Data",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.green),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Sopir();
                          }));
                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          //     builder: (BuildContext context) => new Home()));
                        },
                        child: const Text(
                          "Kembali",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                      ),
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
