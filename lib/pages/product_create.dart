import 'package:flutter/material.dart';
import './../widgets/helpers/ensure-visible.dart';
import '../models/product.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Product product;
  final int productIndex;

  ProductCreatePage(
      {this.addProduct, this.product, this.updateProduct, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreatePage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': 0.0,
    'image': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final FocusNode _titleFocusNode = new FocusNode();
  final FocusNode _descFocusNode = new FocusNode();
  final FocusNode _priceFocusNode = new FocusNode();

  Widget _buildTitleTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(labelText: 'Product title'),
        onSaved: (String value) {
          _formData['title'] = value;
        },
        initialValue: widget.product == null ? '' : widget.product.title,
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ chars long';
          }
        },
      ),
    );
  }

  Widget _buildDescTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _descFocusNode,
      child: TextFormField(
        focusNode: _descFocusNode,
        onSaved: (String value) {
          _formData['description'] = value;
        },
        initialValue: widget.product == null ? '' : widget.product.description,
        validator: (String value) {
          if (value.isEmpty || value.length < 10) {
            return 'Description is required and should be 10+ chars long';
          }
        },
        decoration: InputDecoration(labelText: 'Product Description'),
        maxLines: 4,
      ),
    );
  }

  Widget _buildPriceTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: TextFormField(
        focusNode: _priceFocusNode,
        onSaved: (String value) {
          _formData['price'] = double.parse(value);
        },
        initialValue:
            widget.product == null ? '' : widget.product.price.toString(),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'Price is required and should be a number';
          }
        },
        decoration: InputDecoration(labelText: 'Product price'),
        keyboardType: TextInputType.number,
      ),
    );
  }

  void _onButtonPressHanlder() {
    if (!_fromKey.currentState.validate()) {
      return;
    }
    _fromKey.currentState.save();
    if (widget.product == null) {
      widget.addProduct(Product(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image']));
    } else {
      widget.updateProduct(Product(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image']), widget.productIndex);
    }
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
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

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Editing ' + widget.product.title),
            ),
            body: pageContent,
          );
  }
}
