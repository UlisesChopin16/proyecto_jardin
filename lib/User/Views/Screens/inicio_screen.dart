import 'package:flutter/material.dart';
import 'package:proyecto_jardin/Components/decorated_screen_component.dart';

class InicioView extends StatefulWidget {
  const InicioView({ Key? key }) : super(key: key);

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {

  double width = 0;
  double height = 0;


  void _getScreenSize() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height * 0.78;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getScreenSize();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DecoratedScreenComponent(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Image.asset(
                  'assets/images/logotipo.png',
                  width: width,
                  height: height * 0.3,
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
          ),
        )
      ),      
    );
  }
}