import 'package:cargafacilapp/resource/home/menu/collapsing_list_tile.dart';
import 'package:cargafacilapp/resource/home/menu/lista_menu.dart';
import 'package:cargafacilapp/resource/splash/splashpage.dart';
import 'package:cargafacilapp/themes/theme.dart';
import 'package:cargafacilapp/utils/auth.dart';
import 'package:cargafacilapp/utils/cargafacil.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  int currentIsSelected = 0;
  bool _isCollapsed = false;
  AnimationController _animationController;
  Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ));
    _widthAnimation =
        Tween<double>(begin: CargaFacil.maxWidth, end: CargaFacil.minWidth)
            .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: _widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(children: <Widget>[
          CollapSingListTile(
            titulo: "juan camilo rodriguez diaz",
            icon: Icons.person,
            animationController: _animationController,
          ),
          Divider(color: Colors.grey, height: 40.0),
          Expanded(
            child: ListView.separated(separatorBuilder: (context, counter) {
              return Divider(color: Colors.grey, height: 12.0);
            }, itemBuilder: (context, counter) {
              return CollapSingListTile(
                onTap: () {
                  setState(() {
                    print(counter);
                    currentIsSelected = counter;
                    switch (counter) {
                      case 6:
                             Auth.signOut().then((retorno){
                                  CargaFacil.redireccionarPagina(context, SplashPage());
                          });    
                          break;
                      default:
                    }
                  });
                },
                isSelected: currentIsSelected == counter,
                titulo: itemMenu[counter].titulo,
                icon: itemMenu[counter].icon,
                animationController: _animationController,
              );
            }, itemCount: itemMenu.length,),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isCollapsed = !_isCollapsed;
                _isCollapsed
                    ? _animationController.forward()
                    : _animationController.reverse();
              });
            },
            child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 28.0),
          ),
          SizedBox(height: 50.0),
        ]),
      ),
    );
  }
}
