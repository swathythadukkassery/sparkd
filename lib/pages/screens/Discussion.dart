import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:tictoc/pages/screens/search.dart';

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
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        backgroundColor: Color(0xff145C9E),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: Text('Home'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: Text('Discussion'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
      body: Center(),
    );
  }
}
