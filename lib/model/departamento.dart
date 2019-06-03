import 'dart:collection';
import 'package:cargafacilapp/model/ciudad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Departamento {

  Map _json=new HashMap<String,String>();

  Set <Ciudad> _ciudad=new HashSet<Ciudad>();

  String id;

  String nombre;

  String id_pais;

  Timestamp created_at;
  
  Timestamp updated_at;

  Departamento({@required this.id,@required this.nombre,@required this.id_pais,@required this.created_at,@required this.updated_at}){
    _json["nombre"]=this.nombre;
    _json["id_pais"]=this.id_pais;
    _json["created_at"]=this.created_at;
    _json["updated_at"]=this.updated_at;    
  }

  Set <Ciudad> get ciudad => _ciudad;

  Map get json => _json;
  
}