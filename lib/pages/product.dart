import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(product['title'] + " Detail"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(product['image']),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                product['title'],
                style: TextStyle(fontSize: 26.0, fontFamily: 'Oswald'),
              ),
            ),
            Row(
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
                  '\$ ' + product['price'].toString(),
                  style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                )
              ],
            ),
            Container(
              child: Text(
                product['description'],
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
