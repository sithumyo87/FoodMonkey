import 'package:flutter/material.dart';
import 'package:food_monkey/Pages/Home.dart';
// import 'package:food_monkey/Pages/Flash.dart';

import './Pages/Flash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/' : (context) => Flash(),
      '/home' : (context) => Home(),
    },
    theme: ThemeData(
      fontFamily: "English",
    ),
   );
  }
}
