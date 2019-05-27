import 'dart:collection';
import 'package:cargafacilapp/model/localizacion.dart';
import 'package:flutter/material.dart';
class Pais {

  Map _json=new HashMap<String,String>(); 
  
  Set <Localizacion> _localizacion=new HashSet<Localizacion>();
  
  String id;
  
  String nit;

  String nombre;

  DateTime created_at;
  
  DateTime updated_at;

  Pais({@required this.id,@required this.nit,@required this.nombre,@required this.created_at,@required this.updated_at}){
    _json["nit"]=this.nit;
    _json["nombre"]=this.nombre;
    _json["created_at"]=this.created_at;
    _json["updated_at"]=this.updated_at;
  }

  Set<Localizacion> get localizacion => _localizacion;

  Map get json => _json;
}