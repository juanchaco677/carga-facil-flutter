import 'dart:collection';
import 'package:cargafacilapp/model/viaje.dart';
import 'package:flutter/material.dart';
class Carga {

  Map _json=new HashMap<String,String>(); 
  
  Set <Viaje> _viaje=new HashSet<Viaje>();
  
  String id;

  String tipo;
  
  String descripcion;

  int cantidad;

  String id_empresa_remitente;

  String id_usuario_remitente;

  String id_empresa_destinatario;

  String id_usuario_destinatario;

  DateTime created_at;
  
  DateTime updated_at;

  Carga({@required this.id,@required this.tipo,@required this.cantidad,@required this.descripcion,@required this.id_empresa_remitente,@required this.id_usuario_remitente,@required this.id_empresa_destinatario,@required this.id_usuario_destinatario,@required this.created_at,@required this.updated_at}){

    _json["tipo"] = this.tipo;
    _json["cantidad"] = this.cantidad;
    _json["descripcion"] = this.descripcion;
    _json["id_empresa_remitente"] = this.id_empresa_remitente;
    _json["id_usuario_remitente"] = this.id_usuario_remitente;
    _json["id_empresa_destinatario"] = this.id_empresa_destinatario;
    _json["id_usuario_destinatario"] = this.id_usuario_destinatario;
    _json["created_at"] = this.created_at;
    _json["updated_at"] = this.updated_at;

  }

  Map get json => _json;

  Set <Viaje> get viaje => _viaje;
  
}