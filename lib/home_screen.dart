import 'package:zongovation/views/menu_provider.dart';

import './menu_page.dart';
import './page_structure.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import 'c.dart';
import 'model/menu_item.dart';

class HomeScreen extends StatefulWidget {
  static List<MenuItem> mainMenu = [
    MenuItem(HOME, Icons.home, 0),
    MenuItem(ABOUT_US, Icons.info_outline, 1),
    MenuItem(PROGRAMS, Icons.format_list_bulleted, 2),
    MenuItem(COMMUNITY, Icons.people_outline, 3),
    MenuItem(PARTNERS, Icons.compare_arrows, 4),
  ];

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: MenuScreen(
        HomeScreen.mainMenu,
        callback: _updatePage,
      ),
      mainScreen: MainScreen(),
      borderRadius: 24.0,
//      showShadow: true,
      angle: 0.0,
      slideWidth:
          MediaQuery.of(context).size.width * (ZoomDrawer.isRTL() ? .45 : 0.65),
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }

  void _updatePage(index) {
    Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index);
    _drawerController.toggle();
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rtl = ZoomDrawer.isRTL();
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context).stateNotifier,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child: PageStructure(),
        onPanUpdate: (details) {
          if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
            ZoomDrawer.of(context).toggle();
          }
        },
      ),
    );
  }
}
