import 'package:flutter/material.dart';
import 'package:tictoc/pages/authenticate/constantsFun.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 16,
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://image.freepik.com/free-vector/man-profile-cartoon_18591-58482.jpg'),
                    radius: 40.0,
                  ),
                  Text(
                    Constants.myName,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                ],
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
