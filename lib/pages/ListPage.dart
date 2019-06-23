import 'package:flutter/material.dart';
import '../components/common.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cb(BuildContext ctx, String result) {
      Scaffold.of(ctx).showSnackBar(SnackBar(content: Text('msg: $result')));
    }

    return Scaffold(
        appBar: AppBar(title: Text('product list')),
        body: Container(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, i) {
              return RouterLink(
                  source: ListTile(title: Text('第 $i 个商品')),
                  target: ProductDetail(index: i),
                  cb: cb);
            },
          ),
        ));
  }
}

class ProductDetail extends StatelessWidget {
  final int index;
  const ProductDetail({Key key, @required int this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product detail')),
      body: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context, '已阅第 $index 个商品');
              },
              child: Text('当前是第 $index 个商品'))),
    );
  }
}
