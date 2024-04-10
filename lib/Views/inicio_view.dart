import 'package:flutter/material.dart';

class InicioView extends StatefulWidget {
  const InicioView({ Key? key }) : super(key: key);

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Inicio'),
        )
      ),      
    );
  }
}