import 'package:flutter/material.dart';
import 'product_create.dart';
import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;
  final Function delProducts;

  ProductListPage(this.products, this.updateProduct, this.delProducts);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) delProducts(index);
          },
          key: Key(index.toString()),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    products[index].image,
                  ),
                ),
                title: Text(products[index].title),
                subtitle: Text('\$ ' + products[index].price.toString()),
                trailing: _buildEditButton(context, index),
              ),
              Divider()
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
