import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(Icons.search),
            label: Text('explore'),
          ),
        ),
      ),
    );
  }
}
