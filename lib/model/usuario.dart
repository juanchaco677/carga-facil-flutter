import 'dart:collection';
import 'package:cargafacilapp/model/vehiculo.dart';
import 'package:flutter/material.dart';

class Usuario {
  
  Map _json=new HashMap<String,String>(); 
  
  Set <Vehiculo> _vehiculo=new HashSet<Vehiculo>();

  String id;
  
  String nombre_completo;
  
  String estado;
  
  String tipo;

  String foto_perfil;
  
  String created_at;
  
  String updated_at;

  Usuario({@required this.id, @required this.nombre_completo, @required this.estado, @required this.tipo, this.foto_perfil , @required this.created_at, @required this.updated_at}){

    _json['nombre_completo'] = this.nombre_completo;
    _json['estado'] = this.estado;
    _json['tipo'] = this.tipo;
    _json['foto_perfil'] = this.foto_perfil;
    _json["created_at"] = this.created_at;
    _json["updated_at"] = this.updated_at;

  }

  Map get json => _json;

  Set <Vehiculo> get vehiculo =>_vehiculo;

}
