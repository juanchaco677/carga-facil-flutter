import 'package:cargafacilapp/resource/home/homepage.dart';
import 'package:cargafacilapp/utils/auth.dart';
import 'package:cargafacilapp/utils/cargafacil.dart';
import 'package:cargafacilapp/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:cargafacilapp/services/usuarios/usuario.dart';
import 'package:cargafacilapp/resource/splash/loginscreen.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  final String title;
  SplashPage({Key key, this.title}) : super(key: key) {}
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("constanza mamona");
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Auth.getCurrentFirebaseUser().then((user) {
      if (user != null && !Validator.validateString(user.uid)) {
        Auth auth = new Auth();
        auth.addUsuario(user.uid).then((valor) {
          if (valor) {
            CargaFacil.redireccionarPagina(context, HomePage());
          }
        });
      } else {
        Timer(Duration(seconds: 1),
            () => CargaFacil.redireccionarPagina(context, LoginScreenPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 25)),
                    Center(child: FlutterLogo(size: 400)),
                    CircularProgressIndicator(),
                    Text(
                      "Carga Facil",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
