import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zongovation/views/widget/carousel.dart';

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
//      appBar: AppBar(title: Text('Carousel with indicator demo')),
          body: Column(children: [
            Carousel(),
          ]),
        ),
      ),
    );
  }
}
