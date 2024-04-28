
import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/Escaner/escanear_content_screen.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/Escaner/info_plantas_screen.dart';

class EscanearView extends StatelessWidget {
  
  const EscanearView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      initialRoute: '/escanear',
      routes: {
        '/escanear': (context) => const EscanearContentScreen(),
        '/escanear/infoPlantas': (context) => const InfoPlantasScreen(),
      },
    );
  }
}