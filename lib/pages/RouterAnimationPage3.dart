import 'package:flutter/material.dart';
import './RouterAnimationPage4.dart';
class RouterAnimationPage3 extends StatelessWidget {
  const RouterAnimationPage3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Router Animation 3 ...'),
        elevation: 0,
      ),
      body: Column(children: [
        GestureDetector(
          child: Icon(Icons.arrow_right, color: Colors.white, size: 50),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) {
              return RouterAnimationPage4();
            }));
          },
        )
      ]),
    ));
  }
}
