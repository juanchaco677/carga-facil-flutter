import 'dart:collection';
import 'package:cargafacilapp/model/localizacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Ciudad {

  Map _json=new HashMap<String,String>();
  
  Set <Localizacion> _localizacion=new HashSet<Localizacion>();

  String id;

  String nombre;

  String id_departamento;

  Timestamp created_at;
  
  Timestamp updated_at;
  
  Ciudad({@required this.id,@required this.nombre,@required this.id_departamento,@required this.created_at,@required this.updated_at}){
    _json["nombre"]=this.nombre;
    _json["id_departamento"]=this.id_departamento;
    _json["created_at"]=this.created_at;
    _json["updated_at"]=this.updated_at;
  }

  Set <Localizacion> get localizacion => _localizacion;

  Map get json => _json;
}