import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';

class InicioView extends StatelessWidget {
  const InicioView({ super.key, });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Inicio'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        )
      ),
      body: DecoratedScreenComponent(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Image.asset(
              'assets/images/logotipo.png',
              width: width,
              height: height * 0.2,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: height * 0.2),
          const Text(
            '¡Bienvenido!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      )
    );
  }
}