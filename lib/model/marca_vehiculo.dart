import 'dart:collection';
import 'package:cargafacilapp/model/vehiculo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Pais {

  Map _json=new HashMap<String,String>(); 
  
  Set <Vehiculo> _vehiculo=new HashSet<Vehiculo>();
  
  String id;
  
  String nombre;

  Timestamp created_at;
  
  Timestamp updated_at;

  Pais({@required this.id,@required this.nombre,@required this.created_at,@required this.updated_at}){
    _json["nombre"]=this.nombre;
    _json["created_at"]=this.created_at;
    _json["updated_at"]=this.updated_at;
  }

  Map get json => _json;

  Set<Vehiculo> get vehiculo => _vehiculo;

}