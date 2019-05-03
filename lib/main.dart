import 'package:flutter/material.dart';
import 'pages/auth.dart';
import 'pages/products_admin.dart';
import 'pages/products.dart';
import 'pages/product.dart';
import 'models/product.dart';

// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Product> _products = [];

  void _addProducts(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _updateProduct(Product product, int index) {
    setState(() {
      _products[index] = product;
    });
  }

  void _delProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light,
          buttonColor: Colors.deepPurple),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/prodcuts': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductsAdminPage(
            _addProducts, _updateProduct, _delProduct, _products),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(_products[index]),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products),
        );
      },
    );
  }
}
