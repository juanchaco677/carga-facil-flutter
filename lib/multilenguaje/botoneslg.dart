import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cargafacilapp/l10n/messages_all.dart';
import 'dart:async';

class BotonLG {
  static Future<BotonLG> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return BotonLG();
    });
  }

  static BotonLG of(BuildContext context) {
    return Localizations.of<BotonLG>(context, BotonLG);
  }

  
  String get btnIniciarSesion {
    return Intl.message(
      'Iniciar Sesión',
      name: 'btnsesion',
      desc: 'boton iniciar sesión',
    );
  }

  String get btnFacebook {
    return Intl.message(
      'facebook',
      name: 'btnfacebook',
      desc: 'boton facebook',
    );
  }

  String get btnGoogle {
    return Intl.message(
      'google',
      name: 'btngoogle',
      desc: 'boton google',
    );
  }

   String get btnRegistrateGratis {
    return Intl.message(
      'Registrate Es Gratis',
      name: 'btnregistrategratis',
      desc: 'boton registrate es gratis',
    );
  }

  String get btnSiguiente {
    return Intl.message(
      'Siguiente',
      name: 'btnsiguiente',
      desc: 'boton siguiente',
    );
  }
}

class BotonLGDelegate extends LocalizationsDelegate<BotonLG> {
  const BotonLGDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<BotonLG> load(Locale locale) {
    return BotonLG.load(locale);
  }

  @override
  bool shouldReload(BotonLGDelegate old) {
    return false;
  }
}
