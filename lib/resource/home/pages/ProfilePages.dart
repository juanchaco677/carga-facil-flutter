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
    return Container();
  }
}
