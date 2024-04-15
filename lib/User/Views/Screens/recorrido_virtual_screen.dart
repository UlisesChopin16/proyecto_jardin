import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecorridoVirtualView extends StatefulWidget {
  const RecorridoVirtualView({ Key? key }) : super(key: key);

  @override
  _RecorridoVirtualViewState createState() => _RecorridoVirtualViewState();
}

class _RecorridoVirtualViewState extends State<RecorridoVirtualView> {

  @override
  void initState() {
    super.initState();
    // Establecer la orientación horizontal al entrar en la vista de Recorrido Virtual
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Restaurar la orientación vertical al salir de la vista de Recorrido Virtual
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Recorrido Virtual'),
        )
      ),
    );
  }

}