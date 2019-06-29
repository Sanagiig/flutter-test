import 'package:flutter/material.dart';
import '../components/common.dart';
import '../pages/Page1.dart';
import '../pages/ListPage.dart';
import '../pages/RouterAnimationPage1.dart';
import '../pages/BackgroundFilter.dart';
import '../pages/KeepAlivePage.dart';
import '../pages/SearchBarPage.dart';
import '../pages/WrapLayoutPage.dart';
import '../pages/ExpansionPage.dart';
import '../pages/CurvePage.dart';

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
          LinkBtn(text: 'router animation', page: RouterAnimationPage1()),
          LinkBtn(text: 'bg filter', page: BackgroundFilter()),
          LinkBtn(text: 'keep alive', page: KeepAlivePage()),
          LinkBtn(text: 'keep alive2', page: KeepAlivePage2()),
          LinkBtn(text: 'search ...', page: SearchBarPage()),
          LinkBtn(text: 'wrap layout ...', page: WrapLayoutPage()),
          LinkBtn(text: 'expansion ...', page: ExpansionPage()),
          LinkBtn(text: 'curve ...', page: CurvePage()),
        ],
      ),
    ));
  }
}
