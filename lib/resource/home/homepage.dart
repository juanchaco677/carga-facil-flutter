import 'package:cargafacilapp/resource/home/menu/menu.dart';
import 'package:cargafacilapp/themes/theme.dart';
import 'package:cargafacilapp/utils/auth.dart';
import 'package:cargafacilapp/utils/validator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Auth auth = new Auth();
  HomePage() {
    Auth.getCurrentFirebaseUser().then((user) { 
      if (user != null && !Validator.validateString(user.uid)) {
        auth.addUsuario(user.uid).then((valor) {
          if (valor) {
            print("USUARIO HOME PAGE ${auth.usuario.id}");
          }
        });
      }
    });
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
       
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: drawerBackgroundColor,
          title: Text("Logo"),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
            children: <Widget>[Container(color: Colors.white70), Menu()]),
      ),
    );
  }
}
