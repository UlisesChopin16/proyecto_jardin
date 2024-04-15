import 'package:flutter/material.dart';
import 'package:proyecto_jardin/Constants/colors.dart';

class ButtonComponent extends StatelessWidget {

  final String text;
  final void Function()? onPressed;

  const ButtonComponent({
    Key? key,
    required this.text,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.beige3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}