import 'package:flutter/material.dart';

class AcercadeView extends StatefulWidget {
  const AcercadeView({ super.key });

  @override
  _AcercadeViewState createState() => _AcercadeViewState();
}

class _AcercadeViewState extends State<AcercadeView> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Acerca de'),
        )
      ),
    );
  }
}