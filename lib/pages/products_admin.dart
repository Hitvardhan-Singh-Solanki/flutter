import 'package:flutter/material.dart';
import 'product_create.dart';
import 'product_list.dart';
import '../models/product.dart';

class ProductsAdminPage extends StatelessWidget {
  Widget _buildDrawer(context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
          ListTile(
            leading: Icon(Icons.reply_all),
            title: Text('All Produts'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        drawer: _buildDrawer(context),
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Create Product',
                icon: Icon(Icons.create),
              ),
              Tab(
                text: 'My Products',
                icon: Icon(Icons.list),
              )
            ],
          ),
          title: Text('Manage Products'),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(),
            ProductListPage(null, null, null)
          ],
        ),
      ),
      length: 2,
    );
  }
}
