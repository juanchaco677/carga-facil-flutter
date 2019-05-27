import 'dart:collection';
import 'package:flutter/material.dart';
class Localizacion {

  Map _json=new HashMap<String,String>();

  String id;

  String direccion;

  double lalitud;

  double longitud;

  String id_ciudad;

  String id_empresa;

  DateTime created_at;

  DateTime updated_at;

  Localizacion({@required this.id,@required this.direccion,@required this.lalitud,@required this.longitud,@required this.id_ciudad,@required this.id_empresa,@required this.created_at,@required this.updated_at}){
    _json["direccion"] = this.direccion;
    _json["latitud"] = this.lalitud;
    _json["longitud"] = this.longitud;
    _json["id_ciudad"] = this.id_ciudad;
    _json["id_empresa"] = this.id_empresa;
    _json["created_at"] = this.created_at;
    _json["updated_at"] = this.updated_at;
  }

  Map get json => _json;

}