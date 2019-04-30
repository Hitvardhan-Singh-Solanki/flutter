import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  double price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      child: Text(
        '\$ ' + price.toString(),
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}
