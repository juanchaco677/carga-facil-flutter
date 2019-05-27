import 'dart:collection';
import 'package:flutter/material.dart';
class Telefono {

  Map _json=new HashMap<String,String>();   

  
  String id;
  
  String numero;

  String indicativo;

  String tipo;

  String id_usuario;

  DateTime created_at;
  
  DateTime updated_at;

  Telefono({@required this.id,@required this.numero,@required this.indicativo,@required this.tipo,@required this.id_usuario,@required this.created_at,@required this.updated_at}){
    _json["numero"]=this.numero;
    _json["indicativo"]=this.indicativo;
    _json["tipo"]=this.tipo;
    _json["id_usuario"]=this.id_usuario;
    _json["created_at"]=this.created_at;
    _json["updated_at"]=this.updated_at;
  }

  Map get json => _json;  

}