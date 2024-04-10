import 'package:flutter/material.dart';

class RecorridoVirtualView extends StatefulWidget {
  const RecorridoVirtualView({ Key? key }) : super(key: key);

  @override
  _RecorridoVirtualViewState createState() => _RecorridoVirtualViewState();
}

class _RecorridoVirtualViewState extends State<RecorridoVirtualView> {
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