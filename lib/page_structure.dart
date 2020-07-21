import 'dart:io';
import 'dart:math' show pi;

import './home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import 'c.dart';
import 'home_view.dart';

class PageStructure extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  final Color backgroundColor;
  final double elevation;

  const PageStructure({
    Key key,
    this.title,
    this.child,
    this.actions,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final angle = ZoomDrawer.isRTL() ? 180 * pi / 180 : 0.0;
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    final container = Container(
      color: Colors.grey[300],
      child: Center(
        child: getPage(_currentPage),
      ),
    );
    final color = Theme.of(context).accentColor;
    final style = TextStyle(color: color);

    return PlatformScaffold(
      backgroundColor: Colors.transparent,
      appBar: PlatformAppBar(
        automaticallyImplyLeading: false,
        android: (_) => MaterialAppBarData(elevation: elevation),
        title: Text(APP_NAME),
        leading: Transform.rotate(
          angle: angle,
          child: PlatformIconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              ZoomDrawer.of(context).toggle();
            },
          ),
        ),
        trailingActions: actions,
      ),
      bottomNavBar: PlatformNavBar(
        currentIndex: _currentPage,
        itemChanged: (index) =>
            Provider.of<MenuProvider>(context, listen: false)
                .updateCurrentPage(index),
        items: HomeScreen.mainMenu
            .map(
              (item) => BottomNavigationBarItem(
                title: Text(
                  item.title,
                  style: style,
                ),
                icon: Icon(
                  item.icon,
                  color: color,
                ),
              ),
            )
            .toList(),
      ),
      body: kIsWeb
          ? container
          : Platform.isAndroid
              ? container
              : SafeArea(
                  child: container,
                ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomeView();
        break;
      case 1:
        return Center(
          child: Text('Page with index $index'),
        );
        break;
      case 2:
        return Center(
          child: Text('Page with index $index'),
        );
        break;
      case 3:
        return Center(
          child: Text('Page with index $index'),
        );
        break;
      case 4:
        return Center(
          child: Text('Page with index $index'),
        );
        break;

      default:
        return HomeView();
    }
  }
}
