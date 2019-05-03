import 'package:flutter/material.dart';
import 'product_card.dart';
import '../../scoped-models/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/product.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget prod;
    if (products.length > 0) {
      prod = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(products[index], index);
        },
        itemCount: products.length,
      );
    } else {
      prod = Center(
        child: Text('NO DATA'),
      );
    }
    return prod;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return _buildProductList(model.products);
      },
    );
  }
}
