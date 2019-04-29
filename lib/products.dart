import 'package:flutter/material.dart';
import 'pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function delProduct;

  Products(this.products, {this.delProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(children: <Widget>[
        Image.asset(products[index]['image']),
        Text(products[index]['title']),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("details"),
              onPressed: () => Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ProductPage(products[index]),
                    ),
                  ).then((bool value){
                    if(value) {
                      delProduct(index);
                    }
                  }),
            )
          ],
        )
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
