import 'package:cargafacilapp/resource/login/loginpage.dart';
import 'package:cargafacilapp/multilenguaje/botoneslg.dart';
import 'package:cargafacilapp/resource/splash/splashpage.dart';
import 'package:cargafacilapp/utils/cargafacil.dart';
import 'package:cargafacilapp/resource/register/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeLoginRegisterPage extends StatefulWidget {
  @override
  _HomeLoginRegisterPageState createState() => _HomeLoginRegisterPageState();
}

class _HomeLoginRegisterPageState extends State<HomeLoginRegisterPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  Widget homeLoginRegisterPage() {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage('assets/images/mountains.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 250.0),
                child: Center(
                  child: Icon(
                    Icons.headset_mic,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Carga",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      "Facil",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.redAccent,
                        onPressed: () => goToSignup(), //iniciar sesion login
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
                                  BotonLG.of(context).btnRegistrateGratis,
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
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.grey[350],
                        onPressed: () => goToLogin(), //iniciar sesion login
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
                                  BotonLG.of(context).btnIniciarSesion,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
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
    );
  }

  goToLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  goToSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            LoginPage(),
            homeLoginRegisterPage(),
            SignUpPage()
          ],
          scrollDirection: Axis.horizontal,
        ));
  }
}
