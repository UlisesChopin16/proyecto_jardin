import 'package:flutter/material.dart';

class InfoPlantasScreen extends StatefulWidget {

  const InfoPlantasScreen({ 
    super.key,
  });

  @override
  State<InfoPlantasScreen> createState() => _InfoPlantasScreenState();
}

class _InfoPlantasScreenState extends State<InfoPlantasScreen> {


  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String categoria = routeArgs['qrCode'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de la planta'),
      ),
      body: Center(
        child: Text(
          'La tabla es de la categoria $categoria'
        ),
      ),
    );
  }
}