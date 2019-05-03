import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/title_default.dart';
import '../scoped-models/products.dart';
import '../models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  Row _buildAddressPriceRow(Product product) {
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
      child: ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
          return Scaffold(
            appBar: AppBar(
              title: Text(model.products[productIndex].title + " Detail"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(model.products[productIndex].image),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(model.products[productIndex].title),
                ),
                _buildAddressPriceRow(model.products[productIndex]),
                Container(
                  child: Text(
                    model.products[productIndex].description,
                    textAlign: TextAlign.center,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                )
              ],
            ),
          );
        },
      ),
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}
