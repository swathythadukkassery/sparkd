import 'package:flutter/material.dart';
import 'package:tictoc/pages/authenticate/helperfunction.dart';
import 'package:tictoc/services/auth.dart';
import 'package:tictoc/shared/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tictoc/shared/loading.dart';
import 'package:tictoc/services/database.dart';

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
  DatabaseMethods databaseMethods = new DatabaseMethods();

  bool loading = false;
  //text state
  String email = '';
  String name = '';
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
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                child: Stack(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter valid name' : null,
                            style: TextStyle(color: Colors.black),
                            decoration: textInputDecoration2.copyWith(
                                hintText: 'Name',
                                icon: Icon(Icons.person_outline)),
                            onChanged: (val) {
                              setState(() => name = val);
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter valid email' : null,
                            style: TextStyle(color: Colors.black),
                            decoration: textInputDecoration2.copyWith(
                                hintText: 'Email',
                                icon: Icon(Icons.person_outline)),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            validator: (val) => val.length < 6
                                ? 'Password should contain atleast 6 letters'
                                : null,
                            style: TextStyle(color: Colors.black),
                            decoration: textInputDecoration2.copyWith(
                                hintText: 'Password',
                                icon: Icon(Icons.lock_outline)),
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: Expanded(
                              child: Align(
                                alignment: Alignment(0.2, 1.0),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  color: Colors.pink,
                                  child: Text(
                                    'register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      Map<String, String> userInfoMap = {
                                        'name': name,
                                        'email': email,
                                      };
                                      helperFunctions
                                          .saveUserNameSharedPreference(name);
                                      helperFunctions
                                          .saveUserEmailSharedPreference(email);
                                      setState(() => loading = true);
                                      dynamic result = await _auth
                                          .registerWithEmailAndPassword(
                                              email, password);

                                      if (result == null) {
                                        setState(() {
                                          error = 'supply a valid email';
                                          loading = false;
                                        });
                                      } else {
                                        databaseMethods
                                            .uploadUserInfo(userInfoMap);
                                        helperFunctions
                                            .saveUserLoggedInSharedPreference(
                                                true);
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style:
                                TextStyle(color: Colors.amber, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
  }
}
