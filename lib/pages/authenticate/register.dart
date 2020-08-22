import 'package:flutter/material.dart';
import 'package:tictoc/services/auth.dart';

class Register extends StatefulWidget {
  @override
  final Function toggleView;
  Register({this.toggleView});
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final AuthService _auth = AuthService();
  //text state
  String email = '';
  String password = '';

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          title: Text('SignUp to Spark\'d'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('SignIn')),
          ],
        ),
        body: Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline),
                        hintText: "Email or username"),
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline), hintText: "Password"),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.pink,
                    child: Text(
                      'register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(password);
                      print(email);
                    },
                  ),
                ],
              ),
            )));
  }
}
