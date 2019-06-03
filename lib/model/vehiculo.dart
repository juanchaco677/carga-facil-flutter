import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Vehiculo {

  Map _json=new HashMap<String,String>();
  
  String id;
  
  String placa;

  int modelo;

  String id_conductor;

  String id_marca_vehiculo;

  Timestamp created_at;
  
  Timestamp updated_at;

  Vehiculo({@required this.id,@required this.placa,@required this.modelo,@required this.id_conductor,@required this.id_marca_vehiculo,@required this.created_at,@required this.updated_at}){
    
    _json["placa"]=this.placa;
    _json["modelo"]=this.modelo;
    _json["id_conductor"]=this.id_conductor;
    _json["id_marca_vehiculo"]=this.id_marca_vehiculo;
    _json["created_at"]=this.created_at;
    _json["updated_at"]=this.updated_at;

  }

  Map get json => _json;

}