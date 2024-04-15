
import 'package:flutter/material.dart';
import 'package:proyecto_jardin/User/Views/Screens/Escaner/escanear_content_screen.dart';

class EscanearView extends StatelessWidget {
  
  const EscanearView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const EscanearContentScreen(),
    );
  }
}