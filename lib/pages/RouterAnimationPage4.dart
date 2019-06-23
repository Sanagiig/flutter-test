import 'package:flutter/material.dart';
import './RouterAnimationPage1.dart';
import './HomePage.dart';

class RouterAnimationPage4 extends StatelessWidget {
  const RouterAnimationPage4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('Router Animation 4...'),
        elevation: 0,
      ),
      body: Column(children: [
        GestureDetector(
          child: Icon(Icons.arrow_right, color: Colors.white, size: 50),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) {
              return RouterAnimationPage1();
            }));
          },
        ),
        GestureDetector(
          child: Icon(Icons.home, color: Colors.white, size: 50),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) {
              return HomePage();
            }));
          },
        )
      ]),
    ));
  }
}
