import 'package:flutter/material.dart';
import '../product_manager.dart';
import './products_admin.dart';

class ProductsPage extends StatelessWidget {
  List<Map<String, dynamic>> products = [];
  Function addProduct;
  Function delProduct;

  ProductsPage(this.products, this.addProduct, this.delProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
              ListTile(
                title: Text('Manage Produts'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Easy List"),
        ),
        body: ProductManager(
          addProducts: addProduct,
          delProduct: delProduct,
          products: products,
        ));
  }
}