import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(children: <Widget>[
        Image.asset(products[index]['image']),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                products[index]['title'],
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald'),
              ),
              SizedBox(
                width: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                child: Text(
                  '\$ ' + products[index]['price'].toString(),
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
          child: Text('Union Square, SF'),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey, width: 1.0)),
        ),
        ButtonBar(
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
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget prod = Center(
      child: Text('NO DATA'),
    );

    if (products.length > 0) {
      prod = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }

    return prod;
  }
}
