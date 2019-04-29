import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProducts;

  ProductControl(this.addProducts);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Add Product'),
      onPressed: () {
        addProducts('Sweets');
      },
    );
  }
}
