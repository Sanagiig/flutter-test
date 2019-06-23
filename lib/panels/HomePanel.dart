import 'package:flutter/material.dart';
import '../components/common.dart';
import '../pages/Page1.dart';
import '../pages/ListPage.dart';

class HomePanel extends StatelessWidget {
  const HomePanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: ListView(
        children: <Widget>[
          LinkBtn(text: 'link1', page: Page1()),
          LinkBtn(text: 'product list', page: ProductList()),
        ],
      ),
    ));
  }
}
