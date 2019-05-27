import 'package:cargafacilapp/themes/theme.dart';
import 'package:cargafacilapp/utils/cargafacil.dart';
import 'package:flutter/material.dart';

class CollapSingListTile extends StatefulWidget {
  final String titulo;

  final IconData icon;

  final AnimationController animationController;

  final Function onTap;

  final bool isSelected;
  CollapSingListTile({
    @required this.titulo,
    @required this.icon,
    @required this.animationController,
    this.onTap,
    this.isSelected = false,
  });

  @override
  _CollapSingListTileState createState() => _CollapSingListTileState();
}

class _CollapSingListTileState extends State<CollapSingListTile> {
  Animation<double> _widthAnimation;
  Animation<double> _sizeBoxAnimation;

  @override
  void initState() {
    super.initState();
    _widthAnimation =
        Tween<double>(begin: CargaFacil.maxWidth, end: CargaFacil.minWidth)
            .animate(widget.animationController);
    _sizeBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: _widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(children: <Widget>[
          Icon(widget.icon,
              color: widget.isSelected ? selectedColor : Colors.white30,
              size: 38.0),
          SizedBox(width: _sizeBoxAnimation.value),
          (_widthAnimation.value >= 280)
              ? Text(widget.titulo,
                  style: widget.isSelected
                      ? listTitleSelectedTextStyle
                      : listTitleDefaultTextStyle)
              : Container()
        ]),
      ),
    );
  }
}
