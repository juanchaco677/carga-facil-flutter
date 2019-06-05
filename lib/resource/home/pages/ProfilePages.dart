import 'package:avatar_glow/avatar_glow.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            color: Colors.redAccent,
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AvatarGlow(
                    glowColor: Colors.blue,
                    endRadius: 100.0,
                    duration: Duration(milliseconds: 2000),
                    repeat: true,
                    showTwoGlows: true,
                    repeatPauseDuration: Duration(milliseconds: 100),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircularProfileAvatar(
                          'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
                          radius: 60,
                          backgroundColor: Colors.transparent,
                          borderWidth: 10,
                          borderColor: Colors.brown,
                          elevation: 5.0,
                          cacheImage: true,
                          onTap: () {
                            print('adil');
                          },
                          showInitialTextAbovePicture: true,
                        ),
                      ],
                    ),
                  ),
                  
                ]),
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
          ),
          Container(
            child: Text("hola mundo"),
          )
        ],
      ),
    );
  }
}
