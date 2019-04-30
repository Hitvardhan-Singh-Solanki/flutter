import 'package:flutter/material.dart';
import 'product_create.dart';
import 'product_list.dart';

class ProductsAdminPage extends StatelessWidget {

  final Function addProducts;

  ProductsAdminPage(this.addProducts);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        drawer: Drawer(
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
        ),
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
        body: TabBarView(children: <Widget>[
          ProductCreatePage(addProducts),
          ProductListPage()
        ],),
      ),
      length: 2,
    );
  }
}
