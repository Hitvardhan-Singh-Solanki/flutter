import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/title_default.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);

  Row _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, SF',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          '\$ ' + product.price.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.title + " Detail"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(product.image),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(product.title),
            ),
            _buildAddressPriceRow(),
            Container(
              child: Text(
                product.description,
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            )
          ],
        ),
      ),
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}
