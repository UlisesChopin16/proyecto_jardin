import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/Constants/colors.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.green1,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 8
            ),
          ),
        ),
        useMaterial3: false,
      ),
      home: views[selectedIndex],
    );
  }
}