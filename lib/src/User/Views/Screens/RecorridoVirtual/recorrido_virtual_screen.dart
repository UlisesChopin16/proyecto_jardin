import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/RecorridoVirtual/recorrido_virtual_content_screen.dart';



class RecorridoVirtualView extends StatelessWidget {
  
  const RecorridoVirtualView({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecorridoVirtualContentScreen(),
    );
  }

  

}




