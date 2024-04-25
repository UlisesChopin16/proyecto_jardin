import 'package:flutter/material.dart';

class InfoPlantasScreen extends StatefulWidget {

  final String tipo;

  const InfoPlantasScreen({ 
    super.key,
    required this.tipo
  });

  @override
  _InfoPlantasScreenState createState() => _InfoPlantasScreenState();
}

class _InfoPlantasScreenState extends State<InfoPlantasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'La tabla es de la categoria ${widget.tipo}'
        ),
      ),
    );
  }
}