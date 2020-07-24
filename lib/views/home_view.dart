import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zongovation/views/widget/carousel.dart';
import 'package:zongovation/views/widget/servicies_activities.dart';

import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.grey[200],
//      appBar: AppBar(title: Text('Carousel with indicator demo')),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Carousel(),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Services & Activities',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                ActivityService()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
