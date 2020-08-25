import 'package:flutter/material.dart';
import 'package:tictoc/services/auth.dart';
import 'package:tictoc/shared/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tictoc/shared/loading.dart';

class Register extends StatefulWidget {
  @override
  final Function toggleView;
  Register({this.toggleView});
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text state
  String email = '';
  String password = '';
  String error = '';

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter valid email' : null,
                        style: TextStyle(color: Colors.black),
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Email',
                            icon: Icon(Icons.person_outline)),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Password should contain atleast 6 letters'
                            : null,
                        style: TextStyle(color: Colors.black),
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Password',
                            icon: Icon(Icons.lock_outline)),
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
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'supply a valid email';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.amber, fontSize: 14.0),
                      ),
                    ],
                  ),
                )));
  }
}
