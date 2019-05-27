import 'package:flutter/material.dart';
class CargaFacil {
  static double maxWidth = 300;
  static double minWidth = 70;

  static void redireccionarPagina(BuildContext context, Widget page){
      if(context !=null && page != null){
        print(page);
        print("ENTRO INICIALIZAR LLAMADO");
   
        Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => page),
        );
    }
  }

  static Future<bool> detenerIrSplash() {
    return false as Future<bool>;
  }

}