import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(children: <Widget>[
        Image.asset(products[index]['image']),
        Text(products[index]['title']),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("details"),
              onPressed: () => Navigator
              .pushNamed<bool>(context, '/product/'+index.toString())
            )
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget prod = Center(
      child: Text('NO DATA'),
    );

    if (products.length > 0) {
      prod = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }

    return prod;
  }
}
