import 'dart:convert';

import 'package:cargafacilapp/multilenguaje/etiquetaslg.dart';
import 'package:cargafacilapp/multilenguaje/validacioneslg.dart';
import 'package:cargafacilapp/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CargaFacil {
  static double maxWidth = 300;
  static double minWidth = 70;

  static void redireccionarPagina(BuildContext context, Widget page) {
    if (context != null && page != null) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => page),
      );
    }
  }

  static void redireccionarPaginaSinAnterior(
      BuildContext context, Widget page) {
    if (context != null && page != null) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => page),
      );
    }
  }

  static Future<bool> detenerIrSplash() {
    return false as Future<bool>;
  }

  static showAlertDialog(
      {BuildContext context, String titulo, String mensaje}) {
    // set up the button
    Widget okButton = FlatButton(
      color: Colors.redAccent,
      child: Text(
        "Cancelar",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(children: <Widget>[Divider(height: 5), Text(titulo)]),
      content: Text(mensaje),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showProgresing({BuildContext context}) {
    WillPopScope modal = WillPopScope(
        onWillPop: detenerIrSplash,
        child: Stack(
          children: [
            new Opacity(
              opacity: 0.3,
              child: const ModalBarrier(dismissible: false, color: Colors.grey),
            ),
            new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(EtiquetaLG.of(context).etcargando,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return modal;
      },
    );
  }

  static modalInputEdit(
      {BuildContext context,
      TextEditingController controller,
      Function onTap,
      GlobalKey<FormState> formKey,
      String nombreCampo,
      String nombreBoton}) {
    Scaffold body = Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.transparent,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          height: 240,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                ),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          controller: controller,
                          textAlign: TextAlign.left,
                          validator: (value) {
                            if (Validator.validateString(value)) {
                              return "cadena vacias";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: nombreCampo,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Colors.redAccent,
                  onPressed: onTap,
                  child: new Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    child: Text(
                      nombreBoton,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: MediaQuery.of(context).size.height - 270,
            color: Colors.transparent,
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
          ),
        )
      ]),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return body;
      },
    );
  }

  static Map parseJson(String jsonString) {
    Map decoded = jsonDecode(jsonString);
    return decoded;
  }
}
