import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToolTipPage extends StatelessWidget {
  const ToolTipPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('touch'),
        ),
        body: Container(
            color: Colors.blue,
            child: Center(
              child: Tooltip(message: 'Hello', child: Icon(Icons.ac_unit)),
            )));
  }
}
