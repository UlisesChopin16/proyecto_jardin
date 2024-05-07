import 'package:flutter/material.dart';

class ListImagesComponent extends StatelessWidget {

  final List<String> nombreImagenes;

  const ListImagesComponent({ 
    super.key,
    required this.nombreImagenes
  });


  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: nombreImagenes.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          child: Image.asset(
            'assets/images/acerca_de/${nombreImagenes[index]}.png',
            width: width,
            height: height * 0.2,
            fit: BoxFit.contain,
          ),
        );
      }
    );
  }
}