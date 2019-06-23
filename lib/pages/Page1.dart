import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page1')),
      body: Center(
        child: Container(
          child: Text('page 1'),
        ),
      ),
    );
  }
}
