import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/Inicio/inicio_content_screen.dart';


class InicioView extends StatelessWidget {

  const InicioView({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InicioContentScreen(),      
    );
  }
}