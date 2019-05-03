import 'package:flutter/material.dart';
import 'product_create.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(
            products[index]['image'],
            width: 60.0,
            height: 70.0,
          ),
          title: Text(products[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProductCreatePage(
                      product: products[index],
                      productIndex: index,
                      updateProduct: updateProduct,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
