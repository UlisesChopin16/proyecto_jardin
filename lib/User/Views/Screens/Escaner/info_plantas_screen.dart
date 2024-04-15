import 'package:flutter/material.dart';

class InfoPlantasScreen extends StatefulWidget {

  final String tipo;

  const InfoPlantasScreen({ 
    Key? key,
    required this.tipo
  }) : super(key: key);

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