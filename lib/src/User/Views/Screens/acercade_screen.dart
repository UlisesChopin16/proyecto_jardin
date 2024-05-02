import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';

class AcercadeView extends StatelessWidget {

  const AcercadeView({ super.key });

  static const String acercaDe = 'Jardín Etnobotánico del Centro INAH Morelos.\nVersión 1.1.2\nLos contenidos de esta aplicación pertenecen al Instituto Nacional de Antropología e Historia de México, pueden ser descargados y compartidos sin modificaciones siempre que se reconozca su autor y sin fines comerciales.';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Acerca De'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        )
      ),
      body: DecoratedScreenComponent(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Image.asset(
              'assets/images/logotipo.png',
              width: width,
              height: height * 0.2,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: height * 0.1),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              acercaDe,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      )
    );
  }
}