import 'dart:collection';
import 'package:cargafacilapp/model/carga.dart';
import 'package:flutter/material.dart';
class Polizas {

  Map _json=new HashMap<String,String>(); 
  
  Set <Carga> _carga=new HashSet<Carga>();
  
  String id;
  
  String nombre;

  DateTime created_at;
  
  DateTime updated_at;

  Polizas({@required this.id,@required this.nombre,@required this.created_at,@required this.updated_at}){
    _json["nombre"]=this.nombre;
    _json["created_at"]=this.created_at;
    _json["updated_at"]=this.updated_at;
  }

  Map get json => _json;

  Set<Carga> get carga => _carga;
 
}