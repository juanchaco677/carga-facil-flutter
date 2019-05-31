import 'package:cargafacilapp/multilenguaje/botoneslg.dart';
import 'package:cargafacilapp/multilenguaje/etiquetaslg.dart';
import 'package:cargafacilapp/multilenguaje/validacioneslg.dart';
import 'package:cargafacilapp/resource/home/homepage.dart';
import 'package:cargafacilapp/utils/auth.dart';
import 'package:cargafacilapp/utils/cargafacil.dart';
import 'package:cargafacilapp/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:cargafacilapp/services/usuarios/usuario.dart';
import 'package:cargafacilapp/model/usuario.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  final UsuarioService usuario = new UsuarioService();
  SignUpPage({Key key}) : super(key: key);
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nombreCompletoController = TextEditingController();
  TextEditingController _correoControler = TextEditingController();
  TextEditingController _contrasenaControler = TextEditingController();
  bool _isCheckedConductor = true;
  bool _isCheckedAgente = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(120.0),
                    child: Center(
                      child: Icon(
                        Icons.headset_mic,
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: new Text(
                            EtiquetaLG.of(context).etiquetaCorreo,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.redAccent,
                            width: 0.5,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (Validator.validateString(value)) {
                                return ValidacionLG.of(context).entradavacia;
                              } else if (!Validator.validateEmail(value)) {
                                return ValidacionLG.of(context)
                                    .entradaCorreoNoValido;
                              }
                            },
                            controller: _correoControler,
                            //autofocus: true,
                            // obscureText: true,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: 'ejemplo@live.com',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 24.0,
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: new Text(
                            EtiquetaLG.of(context).etiquetaContrasena,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.redAccent,
                            width: 0.5,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Expanded(
                          child: TextFormField(
                            controller: _contrasenaControler,
                            obscureText: true,
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (Validator.validateString(value)) {
                                return ValidacionLG.of(context).entradavacia;
                              } else if (!Validator.validatePassword(value)) {
                                return ValidacionLG.of(context)
                                    .entradaContrasenaMayorCaracteres;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: '*********',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 24.0,
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: new Text(
                            EtiquetaLG.of(context).etiquetaNombreCompleto,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.redAccent,
                            width: 0.5,
                            style: BorderStyle.solid),
                      ),
                    ),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Expanded(
                          child: TextFormField(
                            controller: _nombreCompletoController,
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (Validator.validateString(value)) {
                                return ValidacionLG.of(context).entradavacia;
                              } else if (!Validator.validateName(value)) {
                                return "Ingrece un nombre correcto";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: '',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 24.0,
                  ),
                  new Row(children: <Widget>[
                    new Container(
                      width: MediaQuery.of(context).size.width - 80,
                      margin: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0),
                      height: 180.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/mountains.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.0, 8.0),
                            blurRadius: 20.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(
                                7.0) //         <--- border radius here
                            ),
                      ),
                      child: CheckboxListTile(
                        activeColor: Colors.redAccent,
                        value: _isCheckedConductor,
                        onChanged: (bool val) =>
                            setState(() => _isCheckedConductor = val),
                        subtitle: !_isCheckedAgente && !_isCheckedConductor
                            ? Text(
                                'Campo requerido',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                        title: Text("Conductor",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ]),
                  Divider(
                    height: 24.0,
                  ),
                  new Row(children: <Widget>[
                    new Container(
                      width: MediaQuery.of(context).size.width - 80,
                      margin: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0),
                      height: 180.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/mountains.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.0, 8.0),
                            blurRadius: 20.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(
                                7.0) //         <--- border radius here
                            ),
                      ),
                      child: CheckboxListTile(
                        activeColor: Colors.redAccent,
                        value: _isCheckedAgente,
                        onChanged: (bool val) =>
                            setState(() => _isCheckedAgente = val),
                        subtitle: !_isCheckedAgente && !_isCheckedConductor
                            ? Text(
                                'Campo requerido',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                        title: Text("Agente Comercial",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ]),
                  Divider(
                    height: 24.0,
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0, bottom: 50.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Colors.redAccent,
                            onPressed: () async {
                              if (_formKey.currentState.validate() &&
                                  (_isCheckedAgente || _isCheckedConductor)) {
                                iconButtonPressed();
                              }
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
                                      BotonLG.of(context).btnSiguiente,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),    
    );
  }

  void iconButtonPressed() {

    Auth.signUp(_correoControler.value.text, _contrasenaControler.value.text)
        .then((String id) {
      Usuario usuario = new Usuario(
        id: id,
        nombre_completo: _nombreCompletoController.value.text,
        estado: "T",
        tipo: "conductor:${_isCheckedConductor},agente:${_isCheckedAgente}",
        created_at: new DateTime.now().toString(),
        updated_at: new DateTime.now().toString(),
      );

      widget.usuario.create(usuario);
      CargaFacil.redireccionarPagina(context, HomePage());

    }).catchError((signUpError) {
      CargaFacil.showAlertDialog(
          context:context, titulo:"¡Cuidado!",mensaje: Auth.getExceptionText(e:signUpError,context: context));
    });

  }
}
