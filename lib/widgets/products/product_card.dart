import 'package:flutter/material.dart';
import 'price_tag.dart';
import '../ui_elements/title_default.dart';
import '../ui_elements/address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;
  ProductCard(this.product, this.index);

  Widget _buildTitlePriceContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product['title']),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product['price']),
        ],
      ),
    );
  }

  Widget _buildButtonContainer(context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            // child: Text('Details'),
            icon: Icon(Icons.info_outline),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + index.toString())),
        IconButton(
            // child: Text('Details'),
            icon: Icon(Icons.favorite_border),
            color: Colors.redAccent,
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + index.toString()))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Image.asset(product['image']),
        _buildTitlePriceContainer(),
        AddressTag('Union Square, SF'),
        _buildButtonContainer(context)
      ]),
    );
  }
}
