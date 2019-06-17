import 'package:cargafacilapp/utils/cargafacil.dart';
import 'package:flutter/material.dart';

class PruebaPages extends StatefulWidget {
  @override
  _PruebaPagesState createState() => _PruebaPagesState();
}

class _PruebaPagesState extends State<PruebaPages>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new FlatButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          color: Colors.redAccent,
          onPressed: () async {
            CargaFacil.modalInputEdit(
                nombreBoton: "Listo",
                nombreCampo: "Nombre Completo:",
                formKey: _formKey,
                context: context,
                controller: new TextEditingController(),
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    print("envio de algo");
                  }
                });
          },
          child: new Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: Text(
                    "BOTON",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
