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
  final Map<String, dynamic> _formData = {
    'title' : null,
    'description' : null,
    'price': 0.0,
    'image' : 'assets/food.jpg'
  };
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product title'),
      onSaved: (String value) {
          _formData['title'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ chars long';
        }
      },
    );
  }

  Widget _buildDescTextField() {
    return TextFormField(
      onSaved: (String value) {
          _formData['description'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and should be 10+ chars long';
        }
      },
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 4,
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      onSaved: (String value) {
          _formData['price'] = double.parse(value);
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number';
        }
      },
      decoration: InputDecoration(labelText: 'Product price'),
      keyboardType: TextInputType.number,
    );
  }

  void _onButtonPressHanlder() {
    if (!_fromKey.currentState.validate()) {
      return;
    }
    _fromKey.currentState.save();
    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _fromKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                textColor: Colors.white,
                child: Text("save"),
                onPressed: _onButtonPressHanlder,
              )
            ],
          ),
        ),
      ),
    );
  }
}
