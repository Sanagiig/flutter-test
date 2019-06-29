import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundFilter extends StatelessWidget {
  const BackgroundFilter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('background filter')),
      body: Stack(children: <Widget>[
        ConstrainedBox(
            //约束盒子组件，添加额外的限制条件到 child上。
            constraints: const BoxConstraints.expand(), //限制条件，可扩展的。
            child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg')),
        Container(
            child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 500,
                  height: 700,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Center(
                      child: Text('Hello world',
                          style: Theme.of(context).textTheme.display3)),
                )),
          ),
        ))
      ]),
    );
  }
}
