import 'package:cargafacilapp/resource/register/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:cargafacilapp/resource/login_register/homeloginregister.dart';
import 'package:cargafacilapp/resource/login/loginpage.dart';

class LoginScreenPage extends StatefulWidget {
  @override
  _LoginScreenPageState createState() => new _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }
 
  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            LoginPage(),
            HomeLoginRegisterPage(),
            SignUpPage(),
          ],
          scrollDirection: Axis.horizontal,
        ));
  }
}
