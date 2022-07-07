import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pengiriman/home_page.dart';
import 'package:pengiriman/member_page.dart';
import 'package:pengiriman/main.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String username = "";
  String nama = "";
  bool _isHidePassword = true;

  _login() async {
    final response = await http.post(
        Uri.parse("https://filipposkripsi.000webhostapp.com/login.php"),
        body: {
          "username": user.text,
          "password": pass.text,
        });
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      _Gagallogin(context, "Username atau Password Anda Salah.");
    } else {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("username", username);
      await pref.setString("nama", nama);
      await pref.setBool("is_login", true);

      if (datauser[0]['user_level'] == '1') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage("$nama")));
      } else if (datauser[0]['user_level'] == '2') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return MemberPage();
          }),
        );
      }

      setState(() {
        username = datauser[0]['user_username'];
        nama = datauser[0]['user_nama'];
      });
    }
  }

  void _Gagallogin(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _tooglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/logo.png'),
      ),
    );

    final email = TextFormField(
      controller: user,
      autofocus: true,
      decoration: new InputDecoration(
        hintText: "username",
        labelText: "Username",
        icon: Icon(Icons.people),
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
        isDense: true,
      ),
      onChanged: (value) {
        //set username  text on change
        username = value;
      },
    );

    final password = TextFormField(
      controller: pass,
      autofocus: false,
      obscureText: _isHidePassword,
      decoration: new InputDecoration(
        hintText: "password",
        labelText: "Password",
        icon: Icon(Icons.lock),
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
        suffixIcon: GestureDetector(
          onTap: () {
            _tooglePasswordVisibility();
          },
          child: Icon(
            _isHidePassword ? Icons.visibility_off : Icons.visibility,
            color: _isHidePassword ? Colors.grey : Colors.blue,
          ),
        ),
        isDense: true,
      ),
    );

    final loginAdmin = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            if (user.value.text.isEmpty) {
              setState(() {
                _Gagallogin(context, "Username tidak boleh kosong.");
              }); //ID gabole kosong
            } else if (pass.value.text.isEmpty) {
              setState(() {
                _Gagallogin(context, "Password tidak boleh kosong.");
              }); //
            } else {
              _login();
            }
            //Navigator.of(context).pushNamed(HomePage.tag);
          },
          color: Colors.lightBlueAccent,
          child: Text('LOGIN', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final copyright = Center(
      child: Text(
        'Copyright 2022 - PT. HERRY PUTRA MANDIRI',
        style: TextStyle(fontSize: 15.0, color: Colors.black),
      ),
    );

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginAdmin,
            SizedBox(height: 24.0),
            copyright
          ],
        ),
      ),
    );
  }
}
