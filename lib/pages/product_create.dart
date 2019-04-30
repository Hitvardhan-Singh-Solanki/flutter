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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Product title'),
            onChanged: (String val) {
              setState(() {
                titleVal = val;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Description'),
            onChanged: (String val) {
              setState(() {
                descVal = val;
              });
            },
            maxLines: 4,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product price'),
            onChanged: (String val) {
              setState(() {
                priceVal = double.parse(val);
              });
            },
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text("save"),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': titleVal,
                'description': descVal,
                'price': priceVal,
                'image': 'assets/food.jpg'
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }
}
