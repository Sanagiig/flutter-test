import 'package:flutter/material.dart';
import './components/common.dart';
import './pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'home',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class TextGrid extends StatelessWidget {
  const TextGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fit = BoxFit.fill;
    final List<Widget> textList = [
      new Image.network(
          'http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',
          fit: fit),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',
          fit: fit),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',
          fit: fit),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',
          fit: fit),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',
          fit: fit),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',
          fit: fit),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',
          fit: fit),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',
          fit: fit),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',
          fit: fit),
    ];
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.7,
          crossAxisSpacing: 22.0,
          mainAxisSpacing: 2.0,
        ),
        itemCount: textList.length,
        itemBuilder: (ctx, i) {
          return textList[i];
        },
      ),
    );
  }
}

class BtnList extends StatelessWidget {
  const BtnList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          new Expanded(
              child: RaisedButton(
                  onPressed: () {},
                  color: Colors.lightBlue,
                  child: new Text('红色按钮'))),
          RaisedButton(
            onPressed: () {},
            color: Colors.orangeAccent,
            child: new Text('黄色按钮'),
          ),
          new Expanded(
              child: RaisedButton(
                  onPressed: () {},
                  color: Colors.pinkAccent,
                  child: new Text('粉色按钮')))
        ],
      ),
    );
  }
}

class StackContainer extends StatelessWidget {
  const StackContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        alignment: const FractionalOffset(0.5, 0.8),
        children: <Widget>[
          Container(
            child: Text('is container'),
            width: 200,
            height: 200,
            color: Colors.lightBlue,
          ),
          Container(
            child: Center(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.orangeAccent,
                child: new Text('黄色按钮'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: new Text(
              '吉林省吉林市昌邑区',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: new Text('技术胖:1513938888'),
            leading: new Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
          new Divider(),
          ListTile(
            title: new Text(
              '北京市海淀区中国科技大学',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: new Text('胜宏宇:1513938888'),
            leading: new Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
          new Divider(),
          ListTile(
            title: new Text(
              '河南省濮阳市百姓办公楼',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: new Text('JSPang:1513938888'),
            leading: new Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
          new Divider(),
        ],
      ),
    );
  }
}
