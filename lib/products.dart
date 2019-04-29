import 'package:flutter/material.dart';

class Products extends StatelessWidget {

  final List<String> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map((ele) => Card(
                child: Column(
                  children: <Widget>[Image.asset('assets/food.jpg'), Text(ele)],
                ),
              ))
          .toList(),
    );
  }
}
