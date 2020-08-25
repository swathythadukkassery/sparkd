import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tictoc/pages/authenticate/sign_in.dart';
import 'package:tictoc/pages/screens/choose_location.dart';
import 'package:tictoc/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () {
              _auth.signOutGoogle();

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return SignIn();
              }), ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseLocation()));
                    },
                    icon: Icon(Icons.search),
                    label: Text(
                      'Explore',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/loading');
                    },
                    icon: Icon(Icons.chat_bubble),
                    label: Text(
                      'Discussion',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
