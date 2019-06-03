import 'dart:collection';
import 'package:cargafacilapp/model/vehiculo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Usuario {
  
  Map json=new HashMap<String,String>(); 
  
  Set <Vehiculo> _vehiculo=new HashSet<Vehiculo>();

  String id;
  
  String nombre_completo;

  String correo;
  
  String estado;

  String sesion;
  
  Map tipo;

  String foto_perfil;
  
  Timestamp created_at;
  
  Timestamp updated_at;

  Usuario.fromJson({this.json}){
    this.id = json['id'];
    this.nombre_completo = json['nombre_completo'];
    this.correo = json['correo'];
    this.sesion = json['sesion'];
    this.estado = json['estado'];
    this.tipo = json['tipo'];
    this.foto_perfil = json['foto_perfil'];
    this.created_at = json["created_at"];
    this.updated_at = json["updated_at"];
  }

  Usuario({@required this.id, @required this.nombre_completo,@required this.correo,@required this.sesion, @required this.estado, @required this.tipo, this.foto_perfil , @required this.created_at, @required this.updated_at}){

    json['nombre_completo'] = this.nombre_completo;
    json['correo'] = this.correo;
    json['sesion'] = this.sesion;
    json['estado'] = this.estado;
    json['tipo'] = this.tipo;
    json['foto_perfil'] = this.foto_perfil;
    json["created_at"] = this.created_at;
    json["updated_at"] = this.updated_at;

  }

  Set <Vehiculo> get vehiculo =>_vehiculo;

}
