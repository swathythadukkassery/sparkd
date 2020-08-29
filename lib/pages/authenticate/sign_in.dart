import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tictoc/pages/authenticate/helperfunction.dart';
import 'package:tictoc/pages/screens/Discussion.dart';
import 'package:tictoc/pages/screens/home.dart';
import 'package:tictoc/services/database.dart';
import 'package:tictoc/shared/loading.dart';
import 'package:tictoc/services/auth.dart';
import 'package:tictoc/shared/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tictoc/services/auth.dart';
import 'authenticate.dart';

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
  bool loading = false;
  QuerySnapshot snapshotUserInfo;
  DatabaseMethods databaseMethods = new DatabaseMethods();

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
              //height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg2.jpg'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 50.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 5.0),
                              TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'Enter valid email' : null,
                                style: TextStyle(color: Colors.white),
                                decoration: textInputDecoration.copyWith(
                                  hintText: 'Email',
                                  icon: Icon(Icons.person_outline),
                                ),
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'Password should contain atleast 6 letters'
                                    : null,
                                style: TextStyle(color: Colors.white),
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
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Colors.pink,
                                child: Text(
                                  'signin',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    helperFunctions
                                        .saveUserEmailSharedPreference(email);
                                    //function to get username
                                    setState(() => loading = true);
                                    databaseMethods
                                        .getUserByEmail(email)
                                        .then((val) {
                                      snapshotUserInfo = val;
                                      helperFunctions
                                          .saveUserNameSharedPreference(
                                              snapshotUserInfo
                                                  .documents[0].data["name"]);
                                    });
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'could not signin with those credentials';
                                        loading = false;
                                      });
                                    } else {
                                      helperFunctions
                                          .saveUserLoggedInSharedPreference(
                                              true);
                                    }
                                  }
                                },
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 14.0),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: _signInButton(),
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        _auth.signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Home();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/googlelogo.jpg"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
