import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {

  final String address;

  AddressTag(this.address);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      child: Text(address),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey, width: 1.0)),
    );
  }
}
