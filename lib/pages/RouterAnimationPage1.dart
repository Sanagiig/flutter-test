import 'package:flutter/material.dart';
import './RouterAnimationPage2.dart';
import '../components/AnimationRoute.dart';

class RouterAnimationPage1 extends StatelessWidget {
  const RouterAnimationPage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Router Animation 1 ...'),
        elevation: 0,
      ),
      body: Column(children: [
        GestureDetector(
          child: Icon(Icons.arrow_right, color: Colors.white, size: 50),
          onTap: () {
            Navigator.of(context).push(FadeRoute(RouterAnimationPage2()));
          },
        )
      ]),
    ));
  }
}
