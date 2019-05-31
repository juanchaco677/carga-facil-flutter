import 'dart:async';
import 'package:cargafacilapp/model/usuario.dart';
import 'package:cargafacilapp/multilenguaje/errores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError, UnknownError }

class Auth {
  
  Usuario usuario;

  static Auth instance;

  factory Auth ({this.usuario}) {
    if (instance == null) {
      instance = new Auth ._internal(usuario:this.usuario);
    }
    return instance;
  }  

  Auth._internal({this.usuario});

  static Future<String> signIn(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  static Future<String> signInWithFacebok(AuthCredential credential) async {
    FirebaseUser user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return user.uid;
  }

  static Future<String> signUp(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  static Future<String> signGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseUser user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return user.uid;
  }

  static Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  static Future<FirebaseUser> getCurrentFirebaseUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  static String getExceptionText({Exception e, BuildContext context}) {
    if (e is PlatformException) {
      switch (e.code) {
        case 'ERROR_WEAK_PASSWORD':
          return ErroresLG.of(context).errorWeakPassword;
          break;

        case 'ERROR_INVALID_EMAIL':
          return ErroresLG.of(context).errorInvalidEmail;
          break;

        case 'ERROR_WRONG_PASSWORD':
          return ErroresLG.of(context).errorWrongPassword;
          break;

        case 'ERROR_TOO_MANY_REQUESTS':
          return ErroresLG.of(context).errorTooManyRequests;
          break;

        case 'ERROR_USER_DISABLED':
          return ErroresLG.of(context).errorUserDisabled;
          break;

        case 'ERROR_EMAIL_ALREADY_IN_USE':
          return ErroresLG.of(context).errorEmailAlreadyInUse;
          break;

        case 'ERROR_INVALID_CREDENTIAL':
          return ErroresLG.of(context).errorInvalidCredential;
          break;

        case 'ERROR_USER_NOT_FOUND':
          return ErroresLG.of(context).errorUserNotFound;
          break;

        default:
          return ErroresLG.of(context).errorUnknown;
      }
    } else {
      return ErroresLG.of(context).errorUnknown;
    }
  }
}
