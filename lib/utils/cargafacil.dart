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

  static showProgresing(
      {BuildContext context}) {
   
    WillPopScope modal = WillPopScope(
      onWillPop: detenerIrSplash,
      child:Stack(
      children: [
        new Opacity(
          opacity: 0.3,
          child: const ModalBarrier(dismissible: false, color: Colors.grey),
        ),
        new Center(
          child: new CircularProgressIndicator(           
          ),
        ),
      ],
      )
    );  
    showDialog(
      
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return modal;
      },
    );
  }
}
