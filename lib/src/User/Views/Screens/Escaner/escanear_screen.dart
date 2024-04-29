
import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/Escaner/escanear_content_screen.dart';

class EscanearView extends StatelessWidget {
  
  const EscanearView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EscanearContentScreen(),
    );
  }
}