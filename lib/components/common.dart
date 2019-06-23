import 'package:flutter/material.dart';

class LinkBtn extends StatelessWidget {
  final String text;
  final Widget page;
  final String endWith;
  const LinkBtn(
      {Key key,
      @required String this.text,
      @required Widget this.page,
      String this.endWith = ' go'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RouterLink(
      target: page,
      source: RaisedButton(
        color: Colors.blue,
        child: new Text(
          "$text $endWith",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class RouterLink extends StatelessWidget {
  final Widget target;
  final Widget source;
  final Function cb;
  const RouterLink(
      {Key key,
      Function this.cb,
      @required Widget this.source,
      @required Widget this.target})
      : super(key: key);

  linkToPage(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return target;
    }));
    
    if(cb != null ){
      cb(context,result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: source,
        onTap: () {
          linkToPage(context);
        },
      ),
    );
  }
}
