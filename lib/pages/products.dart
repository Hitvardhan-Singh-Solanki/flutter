import 'package:flutter/material.dart';
import '../widgets/products/products.dart';
import '../models/product.dart';

class ProductsPage extends StatelessWidget {
  List<Product> products = [];

  ProductsPage(this.products);

  Widget _buildSideDrawer(context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Produts'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text("Easy List"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            )
          ],
        ),
        body: Products(products));
  }
}
