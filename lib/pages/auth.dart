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

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildUsernameTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Username', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String val) {
        setState(() {
          username = val;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String val) {
        setState(() {
          password = val;
        });
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      value: _acceptTerms,
      title: Text('Accept Terms'),
    );
  }

  void _submitForm() {
    // if (username == 'admin' && username == 'admin')
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildUsernameTextField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildPasswordTextField(),
                _buildAcceptSwitch(),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('LOGIN'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
