import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_jardin/Constants/colors.dart';
import 'package:proyecto_jardin/principal_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.green1),
        useMaterial3: true,
      ),
      home: const PrincipalView(),
    );
  }
}

