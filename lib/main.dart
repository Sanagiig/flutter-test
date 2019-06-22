import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'test',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('test home')),
        body: Container(
          // child: ListView(
          //   children: <Widget>[
          //     ListTile(
          //       leading: Icon(Icons.access_alarm),
          //       title: Text('title 1'),
          //     )
          //   ],
          // ),
          child: TextGrid(),
        ));
  }
}

class MyColorList extends StatelessWidget {
  final List colorList;

  MyColorList({Key key, List colorList}):
  colorList = [Colors.blue, Colors.red, Colors.purple,Colors.green],
  super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget>colorListW = [];

    colorList.forEach((item){
      colorListW.add(
        Container(
          width:150,
          height:150,
          color:item
        )
      );
    });

    print(colorListW);
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: colorListW,
      ),
    );
  }
}

class TextGrid extends StatelessWidget {
  const TextGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child:GridView.count(
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 100,
          padding:EdgeInsets.all(20),
          crossAxisCount:4,
          children: <Widget>[
            Text('xxxxxx1',style: TextStyle(color: Colors.lightBlue)),
            Text('xxxxxx2'),
            Text('xxxxxx3'),
            Text('xxxxxx4'),
            Text('xxxxxx5'),
          ],
        ),
      ),
    );
  }
}

class ImaGrid extends StatelessWidget {
  const ImaGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: GridView.builder(
        // gridDelegate: SliverGridDelegate(),
      ),),
    );
  }
}
