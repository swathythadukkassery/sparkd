import 'package:flutter/material.dart';
import 'package:tictoc/services/auth.dart';
import 'package:tictoc/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text state
  String email = '';
  String password = '';
  String error = '';

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          title: Text('SignIn to Spark\'d'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Register')),
          ],
        ),
        body: Container(
          height: 399,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Container(
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
                          'signin',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print('valid');
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() => error =
                                  'could not signin with those credentials');
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
                )),
          ),
        ));
  }
}
