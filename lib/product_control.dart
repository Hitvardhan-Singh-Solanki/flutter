import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProducts;

  ProductControl(this.addProducts);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Add Product'),
      onPressed: () {
        addProducts({
          'title': 'Chocolate',
          'image': 'assets/food.jpg'
        });
      },
    );
  }
}
