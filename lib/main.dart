import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:os_app/utils/ThemeUtils.dart';
import 'package:os_app/utils/DataUtils.dart';
import 'package:os_app/constants/Constants.dart';
import 'package:os_app/events/ChangeThemeEvent.dart';
import './widget/MyDrawer.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final appBarTitles = ['资讯', '动弹', '发现', '我的'];
  final tabTextStyleSelected = TextStyle(color: const Color(0xff63ca6c));
  final tabTextStyleNormal = TextStyle(color: const Color(0xff969696));

  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;

  var tabImages;
  var _body;
  var pages;

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState(){
    super.initState();
    DataUtils.getColorThemeIndex().then((index) {
      print('color theme index = $index');
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
        Constants.eventBus.fire(ChangeThemeEvent(ThemeUtils.supportColors[index]));
      }
    });

    Constants.eventBus.on<ChangeThemeEvent>().listen((event) {
      setState(() {
        themeColor = event.color;
      });
    });

    pages = <Widget>[];

    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return MaterialApp(
      theme: ThemeData(
          primaryColor: themeColor
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitles[_tabIndex],
          style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white)
        ),
        body: _body,
        bottomNavigationBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: getTabIcon(0),
                title: getTabTitle(0)),
            BottomNavigationBarItem(
                icon: getTabIcon(1),
                title: getTabTitle(1)),
            BottomNavigationBarItem(
                icon: getTabIcon(2),
                title: getTabTitle(2)),
            BottomNavigationBarItem(
                icon: getTabIcon(3),
                title: getTabTitle(3)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState((){
              _tabIndex = index;
            });
          },
        ),
        drawer: Mydrawer()
      ),
    );
  }
}

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('list view'),
        ),
        body: ListView.builder(
            itemCount: 100,
            itemExtent: 30.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            }));
  }
}
