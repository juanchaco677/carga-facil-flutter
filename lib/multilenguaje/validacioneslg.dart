import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cargafacilapp/l10n/messages_all.dart';
import 'dart:async';

class ValidacionLG {
  static Future<ValidacionLG> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return ValidacionLG();
    });
  }

  static ValidacionLG of(BuildContext context) {
    return Localizations.of<ValidacionLG>(context, ValidacionLG);
  }

  String get entradavacia {
    return Intl.message(
      'El campo de texto es obligatorio.',
      name: 'envacia',
      desc: 'entrada cadena de texto vacio',
    );
  }

  String get entradaCorreoNoValido {
    return Intl.message(
      'Ingrese un correo válido',
      name: 'encorronovalido',
      desc: 'entrada correo no valido',
    );
  }


  String get entradaContrasenaMayorCaracteres {
    return Intl.message(
      'Ingrese una contraseña mayor a 6 caracteres.',
      name: 'encontrasenacaracteres',
      desc: 'entrada contraseña mayor a 6 carecteres',
    );
  }
}

class ValidacionLGDelegate extends LocalizationsDelegate<ValidacionLG> {
  const ValidacionLGDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<ValidacionLG> load(Locale locale) {
    return ValidacionLG.load(locale);
  }

  @override
  bool shouldReload(ValidacionLGDelegate old) {
    return false;
  }
}
