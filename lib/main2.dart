import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormTestRoute(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class FormTestRoute extends StatefulWidget {
  final String title;
  FormTestRoute({Key key, this.title}) : super(key: key);
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Test"),
        ),
        body: Center(
            child: Container(
          // alignment: Alignment.center,
          width: 400,
          height: 400,
          // padding: EdgeInsets.fromLTRB(10, 0, 20.0, 0),
          // margin: EdgeInsets.all(10.0),
          color:Colors.lightBlue,
          // decoration: BoxDecoration(
          //     border: Border.all(
          //         width: 10.0, style: BorderStyle.solid, color: Colors.red),
          //     gradient: LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //         colors: [Colors.lightBlue, Colors.lightGreen, Colors.pink])),
          child:new Image.network(
              'http://www.fhmryy.com/uploads/161108/5-16110Q43P1O8.jpg',
              colorBlendMode: BlendMode.modulate,
              color:Colors.red,
              repeat: ImageRepeat.repeatX,
              fit: BoxFit.scaleDown),
        )));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  FocusScopeNode focusScopeNode;
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();

  GlobalKey _formKey = new GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void inputChange(String val) {
    print(val);
  }

  void submit() {
    print('user ${_unameController.text}');
    print('pass ${_passController.text}');
  }

  @override
  Widget build(BuildContext context) {
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });

    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
            children: <Widget>[
              Theme(
                  data: Theme.of(context).copyWith(
                      hintColor: Colors.green[200], //定义下划线颜色
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.grey), //定义label字体样式
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                          )),
                  child: TextField(
                      autofocus: true,
                      focusNode: focusNode1,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          prefixIcon: Icon(Icons.person)),
                      // onChanged: inputChange,
                      controller: _unameController)),
              TextField(
                focusNode: focusNode2,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                // onChanged: inputChange,
                controller: _passController,
                obscureText: true,
              ),
              RaisedButton(
                  child: Text('moveFocus'),
                  onPressed: () {
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  }),
              RaisedButton(
                  child: Text('hideKeyboard'),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  }),
              RaisedButton(onPressed: submit, child: Text('Submit'))
            ],
          )),
        ));
  }
}
