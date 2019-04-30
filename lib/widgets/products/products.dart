import 'package:flutter/material.dart';
import 'product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    Widget prod = Center(
      child: Text('NO DATA'),
    );

    if (products.length > 0) {
      prod = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(products[index], index);
        },
        itemCount: products.length,
      );
    }

    return prod;
  }
}
