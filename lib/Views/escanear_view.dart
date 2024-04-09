import 'package:flutter/material.dart';

class EscanearView extends StatefulWidget {
  const EscanearView({ Key? key }) : super(key: key);

  @override
  _EscanearViewState createState() => _EscanearViewState();
}

class _EscanearViewState extends State<EscanearView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Escanear'),
      )
    );
  }
}