import 'package:flutter/material.dart';
import './RouterAnimationPage3.dart';
import '../components/AnimationRoute.dart';

class RouterAnimationPage2 extends StatelessWidget {
  const RouterAnimationPage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('Router Animation 2 ...'),
        elevation: 0,
      ),
      body: Column(children: [
        GestureDetector(
          child: Icon(Icons.arrow_right, color: Colors.white, size: 50),
          onTap: () {
            Navigator.of(context).push(ScaleRoute(RouterAnimationPage3()));
          },
        )
      ]),
    ));
  }
}
