import 'package:cargafacilapp/multilenguaje/botoneslg.dart';
import 'package:cargafacilapp/multilenguaje/etiquetaslg.dart';
import 'package:cargafacilapp/multilenguaje/validacioneslg.dart';
import 'package:cargafacilapp/resource/home/homepage.dart';
import 'package:cargafacilapp/resource/splash/splashpage.dart';
import 'package:cargafacilapp/utils/cargafacil.dart';
import 'package:cargafacilapp/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:cargafacilapp/utils/auth.dart';
import 'package:cargafacilapp/multilenguaje/errores.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({Key key, this.title}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _correoControler = TextEditingController();
  TextEditingController _contrasenaControler = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  FirebaseUser myUser;

  void _logInFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    if (result.status == FacebookLoginStatus.loggedIn) {
      var graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}');
      var profile = JSON.jsonDecode(graphResponse.body);
      AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token);
      CargaFacil.showProgresing(context: context);
      Auth.signInWithFacebok(credential).then((id) {
        if (!Validator.validateString(id)) {
          Auth auth = new Auth();
          auth.addUsuario(id).then((valor) {
            if (valor) {
              Navigator.pop(context);
              CargaFacil.redireccionarPagina(context, HomePage());
            }
          });
        }
      }).catchError((signInError) {
        Navigator.pop(context);
        CargaFacil.showAlertDialog(
            context: context,
            titulo: "¡Cuidado!",
            mensaje: Auth.getExceptionText(e: signInError, context: context));
      });
    } else if (result.status == FacebookLoginStatus.error) {
      CargaFacil.showAlertDialog(
          context: context, titulo: "¡Cuidado!", mensaje: result.errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(120.0),
                    child: Center(
                      child: Icon(
                        Icons.headset_mic,
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: new Text(
                            EtiquetaLG.of(context).etiquetaCorreo,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.redAccent,
                            width: 0.5,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (Validator.validateString(value)) {
                                return ValidacionLG.of(context).entradavacia;
                              } else if (!Validator.validateEmail(value)) {
                                return ValidacionLG.of(context)
                                    .entradaCorreoNoValido;
                              }
                            },
                            controller: _correoControler,
                            //autofocus: true,
                            // obscureText: true,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: 'ejemplo@live.com',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 24.0,
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: new Text(
                            EtiquetaLG.of(context).etiquetaContrasena,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.redAccent,
                            width: 0.5,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Expanded(
                          child: TextFormField(
                            controller: _contrasenaControler,
                            obscureText: true,
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (Validator.validateString(value)) {
                                return ValidacionLG.of(context).entradavacia;
                              } else if (!Validator.validatePassword(value)) {
                                return ValidacionLG.of(context)
                                    .entradaContrasenaMayorCaracteres;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: '*********',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 24.0,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: new FlatButton(
                          child: new Text(
                            EtiquetaLG.of(context).etiquetaOlvidoContrasena,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent[900],
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 20.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Colors.redAccent,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                CargaFacil.showProgresing(context: context);
                                Auth.signIn(_correoControler.text,
                                        _contrasenaControler.text)
                                    .then((id) {
                                  if (!Validator.validateString(id)) {
                                    Auth auth = new Auth();
                                    auth.addUsuario(id).then((valor) {
                                      if (valor) {
                                        Navigator.pop(context);
                                        CargaFacil.redireccionarPagina(
                                            context, HomePage());
                                      }
                                    });
                                  }
                                }).catchError((signInError) {
                                  Navigator.pop(context);
                                  CargaFacil.showAlertDialog(
                                      context: context,
                                      titulo: "¡Cuidado!",
                                      mensaje: Auth.getExceptionText(
                                          e: signInError, context: context));
                                });
                              }
                            },
                            child: new Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: Text(
                                      BotonLG.of(context).btnIniciarSesion,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 20.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            margin: EdgeInsets.all(8.0),
                            decoration:
                                BoxDecoration(border: Border.all(width: 0.25)),
                          ),
                        ),
                        Text(
                          EtiquetaLG.of(context).etiquetaConectarceCon,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            margin: EdgeInsets.all(8.0),
                            decoration:
                                BoxDecoration(border: Border.all(width: 0.25)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Stack(children: <Widget>[
                            new Center(
                              child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 0.0, right: 15.0, top: 0.0),
                                      child: Material(
                                        elevation: 4.0,
                                        shape: CircleBorder(),
                                        color: Colors.blueAccent[900],
                                        child: Ink.image(
                                          image: AssetImage(
                                            "graphics/flogo-HexRBG-Wht-100.png",
                                            package: "flutter_auth_buttons",
                                          ),
                                          fit: BoxFit.cover,
                                          width: 60.0,
                                          height: 60.0,
                                          child: InkWell(
                                            onTap: _logInFacebook,
                                            child: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15.0, right: 00.0, top: 0.0),
                                      child: Material(
                                        elevation: 4.0,
                                        shape: CircleBorder(),
                                        color: Colors.grey[300],
                                        child: Ink.image(
                                          image: AssetImage(
                                            "graphics/google-logo.png",
                                            package: "flutter_auth_buttons",
                                          ),
                                          fit: BoxFit.cover,
                                          width: 60.0,
                                          height: 60.0,
                                          child: InkWell(
                                            onTap: () {
                                              CargaFacil.showProgresing(
                                                  context: context);
                                              Auth.signGoogle().then((id) {
                                                if (!Validator.validateString(
                                                    id)) {
                                                  Auth auth = new Auth();
                                                  auth
                                                      .addUsuario(id)
                                                      .then((valor) {
                                                    if (valor) {
                                                      Navigator.pop(context);
                                                      CargaFacil
                                                          .redireccionarPagina(
                                                              context,
                                                              HomePage());
                                                    }
                                                  });
                                                }
                                              }).catchError((signInError) {
                                                Navigator.pop(context);
                                                CargaFacil.showAlertDialog(
                                                    context: context,
                                                    titulo: "¡Cuidado!",
                                                    mensaje:
                                                        Auth.getExceptionText(
                                                            e: signInError,
                                                            context: context));
                                              });
                                            },
                                            child: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            )
                          ])
                        ]),
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
