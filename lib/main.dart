import 'package:cargafacilapp/multilenguaje/botoneslg.dart';
import 'package:cargafacilapp/multilenguaje/errores.dart';
import 'package:cargafacilapp/multilenguaje/etiquetaslg.dart';
import 'package:cargafacilapp/multilenguaje/validacioneslg.dart';
import 'package:cargafacilapp/resource/splash/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
       localizationsDelegates: [
        BotonLGDelegate(),
        EtiquetaLGDelegate(),
        ValidacionLGDelegate(),
        ErroresLGDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ""),
        Locale("es", ""),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.redAccent,
        accentColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[400],        
      ),      
      onGenerateTitle: (BuildContext context) =>
          EtiquetaLG.of(context).titulo,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}