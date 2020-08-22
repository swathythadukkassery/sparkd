import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getTime() async {
  //   Response response =
  //       await get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
  //   Map data = jsonDecode(response.body);
  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'];
  //   DateTime now = DateTime.parse(datetime);
  //   print(now);
  // }

  // void initState() {
  //   super.initState();
  //   getTime();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Discussion'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Home',
              style: TextStyle(fontSize: 20.0),
            )),
      ),
    );
  }
}