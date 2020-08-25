import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictoc/pages/authenticate/authenticate.dart';
import 'package:tictoc/pages/authenticate/sign_in.dart';
import 'package:tictoc/pages/models/user.dart';
import 'package:tictoc/pages/screens/choose_location.dart';
import 'package:tictoc/pages/screens/home.dart';
import 'package:tictoc/pages/screens/Discussion.dart';
import 'package:tictoc/pages/screens/profile.dart';
import 'package:tictoc/pages/wrapper.dart';
import 'package:tictoc/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        // initialRoute: '/',
        // routes: {
        //   '/SignIn': (context) => SignIn(),
        //   '/': (context) => Wrapper(),
        //   '/loading': (context) => Loading(),
        //   '/home': (context) => Home(),
        //   '/location': (context) => ChooseLocation(),
        //   '/profile': (context) => profile(),
        //   '/authenticate': (context) => Authenticate(),
        // },
      ),
    );
  }
}
