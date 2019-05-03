import 'package:flutter/material.dart';
import './../widgets/helpers/ensure-visible.dart';
import '../models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/products.dart';

class ProductCreatePage extends StatefulWidget {
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

  Widget _buildTitleTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(labelText: 'Product title'),
        onSaved: (String value) {
          _formData['title'] = value;
        },
        initialValue: product == null ? '' : product.title,
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ chars long';
          }
        },
      ),
    );
  }

  Widget _buildDescTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _descFocusNode,
      child: TextFormField(
        focusNode: _descFocusNode,
        onSaved: (String value) {
          _formData['description'] = value;
        },
        initialValue: product == null ? '' : product.description,
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

  Widget _buildPriceTextField(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: TextFormField(
        focusNode: _priceFocusNode,
        onSaved: (String value) {
          _formData['price'] = double.parse(value);
        },
        initialValue: product == null ? '' : product.price.toString(),
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

  void _onButtonPressHanlder(Function addProduct, Function updateProduct,
      {int selecteProductIndex}) {
    if (!_fromKey.currentState.validate()) {
      return;
    }
    _fromKey.currentState.save();
    if (selecteProductIndex == null) {
      addProduct(Product(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image']));
    } else {
      updateProduct(
          Product(
              title: _formData['title'],
              description: _formData['description'],
              price: _formData['price'],
              image: _formData['image']),
          selecteProductIndex);
    }
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget _buildSubmitButton(Product selectedProduct) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return RaisedButton(
          textColor: Colors.white,
          child: Text("save"),
          onPressed: () => _onButtonPressHanlder(
              model.addProduct, model.updateProduct,
              selecteProductIndex: model.selectedProductIndex),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Product selectedProduct) {
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
              _buildTitleTextField(selectedProduct),
              _buildDescTextField(selectedProduct),
              _buildPriceTextField(selectedProduct),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton(selectedProduct),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        final Widget pageContent =
            _buildPageContent(context, model.selectedProduct);
        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Editing ' + model.selectedProduct.title),
                ),
                body: pageContent,
              );
      },
    );
  }
}
