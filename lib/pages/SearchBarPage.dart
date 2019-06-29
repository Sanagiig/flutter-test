import 'package:flutter/material.dart';

class SearchBarPage extends StatefulWidget {
  SearchBarPage({Key key}) : super(key: key);

  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  Map result = {'query': ''};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('search...'), actions: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  print(result);
                }),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: MySearchBarDelegate(result));
                }),
          ]),
          body: Container()),
    );
  }
}

class MySearchBarDelegate extends SearchDelegate<String> {
  Map result;

  final searchList = ["jiejie-大长腿", "jiejie-水蛇腰", "gege1-帅气欧巴", "gege2-小鲜肉"];

  final recentSuggest = ["推荐-1", "推荐-2"];

  MySearchBarDelegate(this.result);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();

    result['query'] = query;
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ])),
            ));
  }
}
