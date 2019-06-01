import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cargafacilapp/l10n/messages_all.dart';
import 'dart:async';

class EtiquetaLG {
  static Future<EtiquetaLG> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return EtiquetaLG();
    });
  }

  static EtiquetaLG of(BuildContext context) {
    return Localizations.of<EtiquetaLG>(context, EtiquetaLG);
  }

  String get titulo {
    return Intl.message(
      'Carga Facil',
      name: 'tituloAPP',
      desc: 'título de la aplicacion',
    );
  }

  String get etiquetaCorreo {
    return Intl.message(
      'Correo:',
      name: 'etcorreo',
      desc: 'etiqueta correo electronico',
    );
  }

  String get etiquetaContrasena {
    return Intl.message(
      'Contraseña:',
      name: 'etcontrasena',
      desc: 'etiqueta contraseña',
    );
  }

  String get etiquetaOlvidoContrasena {
    return Intl.message(
      '¿Olvidaste Tu Contraseña?',
      name: 'etolvidocontrasena',
      desc: 'etiqueta olvidaste contraseña',
    );
  }

  String get etiquetaConectarceCon {
    return Intl.message(
      'o conectarce con',
      name: 'etconectarcecon',
      desc: 'etiqueta o conectarse con',
    );
  }

  String get etiquetaNombreCompleto {
    return Intl.message(
      'Nombre Completo:',
      name: 'etnombrecompleto',
      desc: 'etiqueta nombre completo',
    );
  }
}

class EtiquetaLGDelegate extends LocalizationsDelegate<EtiquetaLG> {
  const EtiquetaLGDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<EtiquetaLG> load(Locale locale) {
    return EtiquetaLG.load(locale);
  }

  @override
  bool shouldReload(EtiquetaLGDelegate old) {
    return false;
  }
}
