import 'package:flutter/material.dart';

class DrawerNavigation extends StatelessWidget {

  final int selectedIndex;
  final List<Widget> views;

  const DrawerNavigation({
    super.key,
    required this.selectedIndex,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: views[selectedIndex],
    );
  }
}