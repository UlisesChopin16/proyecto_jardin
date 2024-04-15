import 'package:flutter/material.dart';

class RegistroEventoView extends StatefulWidget {
  const RegistroEventoView({ Key? key }) : super(key: key);

  @override
  _RegistroEventoViewState createState() => _RegistroEventoViewState();
}

class _RegistroEventoViewState extends State<RegistroEventoView> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Registro de Evento'),
        ),
      ),
    );
  }
}