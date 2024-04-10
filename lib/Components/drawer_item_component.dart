import 'package:flutter/material.dart';
import 'package:proyecto_jardin/Constants/colors.dart';

class DrawerItemComponent extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const DrawerItemComponent({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 20,bottom: 10,),
        decoration: const BoxDecoration(
          color: Palette.green3,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      )
    );
  }
}