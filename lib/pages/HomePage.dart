import 'package:flutter/material.dart';
import '../components/BottomNavigator.dart';
import 'package:test1/panels/HomePanel.dart';
import '../panels/HomePanel.dart';
import '../panels/EmailPanel.dart';
import '../panels/SettingPanel.dart';

class HomePage extends StatefulWidget {
  int curIndex = 0;
  final List<Text> titleList = const [
    Text('home'),
    Text('email'),
    Text('settings'),
    Text('settings'),
  ];

  final List<IconData> iconList = const [
    Icons.home,
    Icons.email,
    Icons.settings,
    Icons.access_alarm
  ];

  final List<Widget> _panelList = const [
    HomePanel(),
    EmailPanel(),
    SettingPanel()
  ];

  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void indexChange(int v) {
    setState(() {
      widget.curIndex = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget panel = widget._panelList[widget.curIndex];

    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('Navigation ...')),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBar: BottomNavigator(
          //   titleList: widget.titleList,
          //   iconList: widget.iconList,
          //   indexChange: indexChange,
          // ),
          bottomNavigationBar: MyBottomAppBar(
            iconList: widget.iconList,
          ),
          body: panel),
    );
  }
}
