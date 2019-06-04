import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class ProfilePages extends StatefulWidget {
  @override
  _ProfilePagesState createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
    return AvatarGlow(
    glowColor: Colors.blue,
    endRadius: 90.0,
    duration: Duration(milliseconds: 2000),
    repeat: true,
    showTwoGlows: true,
    repeatPauseDuration: Duration(milliseconds: 100),
    child: Material(
      elevation: 8.0,
      shape: CircleBorder(),
      child: CircleAvatar(
        backgroundColor:Colors.grey[100] ,
        child: Image.asset('assets/images/flutter.png',height: 60,),
        radius: 40.0,
      ),
    ),
  );
  }
}
