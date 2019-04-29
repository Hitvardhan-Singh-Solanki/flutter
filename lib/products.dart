import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(children: <Widget>[
        Image.asset('assets/food.jpg'),
        Text(products[index])
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
