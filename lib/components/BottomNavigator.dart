import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  final List<IconData> iconList;
  final List<Text> titleList;
  final Function indexChange;
  int _curIndex = 0;
  Color color;

  BottomNavigator(
      {Key key,
      Color this.color = Colors.lightBlue,
      @required Function this.indexChange,
      @required List<IconData> this.iconList,
      this.titleList})
      : assert(titleList == null || titleList.length == iconList.length),
        super(key: key);

  List getItemList() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < iconList.length; i++) {
      items.add(BottomNavigationBarItem(
          icon: Icon(iconList[i]), title: titleList[i]));
    }
    return items;
  }

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _curIndex = 0;

  void _indexChange(int v) {
    setState(() {
      _curIndex = v;
    });
    widget.indexChange(v);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: widget.getItemList(),
      currentIndex: _curIndex,
      onTap: _indexChange,
      fixedColor: Colors.blue,
    );
  }
}

class MyBottomAppBar extends StatefulWidget {
  final List<IconData> iconList;

  MyBottomAppBar({Key key, this.iconList}) : super(key: key);

  List getItemList() {
    List<Widget> items = [];
    for (int i = 0; i < iconList.length; i++) {
      items.add(IconButton(
          icon: Icon(iconList[i]), color: Colors.white, onPressed: () {}));
    }
    return items;
  }

  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.getItemList(),
        ),
      ),
    );
  }
}
