import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String username;
  String password;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String val) {
                setState(() {
                  username = val;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (String val) {
                setState(() {
                  password = val;
                });
              },
            ),
            SwitchListTile(
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                }); 
              },
              value: _acceptTerms,
              title: Text('Accept Terms'),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('LOGIN'),
              onPressed: () {
                // if (username == 'admin' && username == 'admin')
                Navigator.pushReplacementNamed(context, '/products');
              },
            ),
          ],
        ),
      ),
    );
  }
}
