import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Discussion extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
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
