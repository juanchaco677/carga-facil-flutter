import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cargafacilapp/l10n/messages_all.dart';
import 'dart:async';

class ErroresLG {
  static Future<ErroresLG> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return ErroresLG();
    });
  }

  static ErroresLG of(BuildContext context) {
    return Localizations.of<ErroresLG>(context, ErroresLG);
  }

  String get errorWeakPassword {
    return Intl.message(
      'La contraseña no es segura.',
      name: 'ERROR_WEAK_PASSWORD',
      desc: 'La contraseña no es segura.',
    );
  }

  String get errorInvalidEmail {
    return Intl.message(
      'Dirección de correo electrónico incorrecta.',
      name: 'ERROR_INVALID_EMAIL',
      desc: 'Dirección de correo electrónico incorrecta.',
    );
  }

  String get errorWrongPassword {
    return Intl.message(
      'La contraseña es incorrecta.',
      name: 'ERROR_WRONG_PASSWORD',
      desc: 'La contraseña es incorrecta.',
    );
  }

  String get errorTooManyRequests {
    return Intl.message(
      'Hubo varios intentos de sesión con este usuario.',
      name: 'ERROR_TOO_MANY_REQUESTS',
      desc: 'Hubo varios intentos de sesión con este usuario.',
    );
  }

  String get errorUserDisabled {
    return Intl.message(
      'El usuario ha sido desabilitado.',
      name: 'ERROR_USER_DISABLED',
      desc: 'El usauario ha sido desabilitado.',
    );
  }

  String get errorEmailAlreadyInUse {
    return Intl.message(
      'La dirección de correo electrónico esta en uso.',
      name: 'ERROR_EMAIL_ALREADY_IN_USE',
      desc: 'La dirección de correo electrónico esta en uso.',
    );
  }

  String get errorInvalidCredential {
    return Intl.message(
      'Credenciales incorrectas.',
      name: 'ERROR_INVALID_CREDENTIAL',
      desc: 'Credenciales incorrectas.',
    );
  }

  String get errorUserNotFound {
    return Intl.message(
      'No hay ningún usuario registrado con ese correo electrónico.',
      name: 'ERROR_USER_NOT_FOUND',
      desc: 'No hay ningún usuario registrado con ese correo electrónico.',
    );
  }

  String get errorUnknown {
    return Intl.message(
      'Ocurrió un error desconocido.',
      name: 'ERROR_UNKNOWN',
      desc: 'Ocurrió un error desconocido.',
    );
  }
}

class ErroresLGDelegate extends LocalizationsDelegate<ErroresLG> {
  const ErroresLGDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<ErroresLG> load(Locale locale) {
    return ErroresLG.load(locale);
  }

  @override
  bool shouldReload(ErroresLGDelegate old) {
    return false;
  }
}
