import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreatePage> {
  String titleVal;
  String descVal;
  double priceVal;

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product title'),
      onChanged: (String val) {
        setState(() {
          titleVal = val;
        });
      },
    );
  }

  Widget _buildDescTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Description'),
      onChanged: (String val) {
        setState(() {
          descVal = val;
        });
      },
      maxLines: 4,
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product price'),
      onChanged: (String val) {
        setState(() {
          priceVal = double.parse(val);
        });
      },
      keyboardType: TextInputType.number,
    );
  }

  void _onButtonPressHanlder() {
    final Map<String, dynamic> product = {
      'title': titleVal,
      'description': descVal,
      'price': priceVal,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text("save"),
            onPressed: _onButtonPressHanlder,
          )
        ],
      ),
    );
  }
}
