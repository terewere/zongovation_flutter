import 'package:zongovation/app/locator.dart';
import 'package:zongovation/views/menu_provider.dart';

import './home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'c.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      onGenerateTitle: (context) => APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.red,
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (_) => MenuProvider(),
        child: HomeScreen(),
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: APP_NAME,
//      onGenerateTitle: (context) => APP_NAME,
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primarySwatch: Colors.red,
//        scaffoldBackgroundColor: Color(0xffFEFDFD),
//        appBarTheme: AppBarTheme(
//          color: Color(0xffFEFDFD),
//          elevation: 0,
//          textTheme: TextTheme(
//            title: TextStyle(
//              color: Colors.blue[900],
//              fontWeight: FontWeight.bold,
//            ),
//          ),
//          iconTheme: IconThemeData(
//            color: Colors.blue[900],
//          ),
//          actionsIconTheme: IconThemeData(
//            color: Colors.blue[900],
//          ),
//        ),
//      ),
//      home: ChangeNotifierProvider(
//        create: (_) => MenuProvider(),
//        child: HomeScreen(),
//      ),
//    );
//  }
//}
