import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/Constants/colors.dart';

class ButtonComponent extends StatelessWidget {

  final String text;
  final void Function()? onPressed;

  const ButtonComponent({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.beige3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )
      ),
    );
  }
}