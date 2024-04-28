import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/RecorridoVirtual/imagen_360_screen.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/RecorridoVirtual/recorrido_virtual_content_screen.dart';



class RecorridoVirtualView extends StatelessWidget {
  
  const RecorridoVirtualView({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/recorridoVirtual',
      routes: {
        '/recorridoVirtual': (context) => const RecorridoVirtualContentScreen(),
        '/recorridoVirtual/imagen360': (context) => const Imagen360Screen(),
      },
    );
  }

  

}




