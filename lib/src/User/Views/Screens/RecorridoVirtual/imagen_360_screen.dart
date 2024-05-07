import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class Imagen360Screen extends StatefulWidget {
  const Imagen360Screen({ super.key });

  @override
  State<Imagen360Screen> createState() => _Imagen360ScreenState();
}

class _Imagen360ScreenState extends State<Imagen360Screen> {

  @override
  void initState() {
    super.initState();
    // Restaurar la orientación vertical al entrar a la vista de Recorrido Virtual
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // Restaurar la orientación vertical al salir de la vista de Recorrido Virtual
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String number = routeArgs['number'];
    String image = 'assets/images/recorrido_virtual/$number.jpg';

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PanoramaViewer(
        sensorControl: SensorControl.orientation,
        child: Image.asset(image),
      ),
    );
  }
}