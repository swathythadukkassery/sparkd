import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://wallpapercave.com/wp/wp3458025.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.freepik.com/free-vector/man-profile-cartoon_18591-58482.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 90,
              color: Colors.blue,
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Home')),
          ],
        ),
      ),
    );
  }
}
