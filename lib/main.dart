import 'package:flutter/material.dart';
import 'package:tictoc/pages/choose_location.dart';
import 'package:tictoc/pages/home.dart';
import 'package:tictoc/pages/loading.dart';
import 'package:tictoc/pages/profile.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
        '/profile': (context) => profile(),
      },
    ));
