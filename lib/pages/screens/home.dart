import 'package:flutter/material.dart';
import 'package:tictoc/pages/authenticate/sign_in.dart';
import 'package:tictoc/pages/screens/Discussion.dart';
import 'package:tictoc/pages/screens/choose_location.dart';
import 'package:tictoc/pages/screens/popup.dart';
import 'package:tictoc/pages/screens/profile.dart';
import 'package:tictoc/services/auth.dart';
import 'package:tictoc/pages/authenticate/constantsFun.dart';
import 'package:tictoc/pages/authenticate/helperfunction.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final AuthService _auth = AuthService();

  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await helperFunctions.getUserNameSharedPreference();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          // FlatButton.icon(
          //   icon: Icon(
          //     Icons.person,
          //     color: Colors.white,
          //   ),
          //   label: Text('logout'),
          //   onPressed: () async {
          //     await _auth.signOut();
          //   },
          // ),
          // FlatButton.icon(
          //   icon: Icon(Icons.person),
          //   label: Text('logout'),
          //   onPressed: () {
          //     //await _auth.signOut();
          //     _auth.signOutGoogle();

          //     Navigator.of(context).pushAndRemoveUntil(
          //         MaterialPageRoute(builder: (context) {
          //       return SignIn();
          //     }), ModalRoute.withName('/'));
          //   },
          // ),
          PopupMenuButton<String>(
            onSelected: choiceActions,
            itemBuilder: (BuildContext context) {
              return PopUp.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.fill)),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                color: Colors.blue[700],
                child: Row(
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
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      child: FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Discussion()));
                          // Navigator.pushNamed(context, '/loading');
                        },
                        icon: Icon(Icons.chat),
                        label: Text(
                          'Discussion',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void choiceActions(String choice) {
    print('$choice');
    if (choice == 'SignOut') {
      _auth.signOut();
    } else if (choice == 'Logout') {
      _auth.signOutGoogle();

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return SignIn();
      }), ModalRoute.withName('/'));
    } else if (choice == 'Profile') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => profile()));
    }
  }
}
