import 'package:zongovation/app/locator.dart';
import 'package:zongovation/views/landing_page.dart';
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
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
      ),
      home: LandingPage(),

//      home: ChangeNotifierProvider(
//        create: (_) => MenuProvider(),
//        child: HomeScreen(),
//      ),
    );
  }
}
