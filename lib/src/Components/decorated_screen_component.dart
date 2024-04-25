import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/Constants/colors.dart';

class DecoratedScreenComponent extends StatelessWidget {

  final bool changeColors;
  
  final Widget child;

  const DecoratedScreenComponent({ 
    super.key,
    required this.child,
    this.changeColors = false
  });

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        dibujo(
          width: width,
          height: height,
          painter: CuadroUno(color: !changeColors ? Palette.green1 : Palette.beige2),
        ),
        dibujo(
          width: width,
          height: height,
          painter: CuadroDos(color: !changeColors ? Palette.beige2 : Palette.green1)
        ),
        Positioned(
          top: 0,
          left: 0,
          width: width,
          height: height * 0.78,
          child: child
        ),
      ],
    );
  }

  dibujo({
    required double width,
    required double height,
    required CustomPainter painter,
  }){
    return Positioned(
      top: height * 0.55,
      left: 0,
      child: CustomPaint(
        painter: painter,
        size: Size(
          // Width
          width,
          // Height
          height * 0.35
        ),
      ),
    );
  }
}

class CuadroUno extends CustomPainter{

  final Color color;

  // metodo constructor
  const CuadroUno({ 
    required this.color
  });

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint pencil = Paint();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 5;
    pencil.color = color;

    double width = size.width;
    double height = size.height;

    final path = Path();

    path.moveTo(width * 0.25, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    // path.lineTo(width * 0.85, 0);

    path.close();
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class CuadroDos extends CustomPainter{

  final Color color;

  // metodo constructor
  const CuadroDos({ 
    required this.color
  });

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint pencil = Paint();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 5;
    pencil.color = color;

    double width = size.width;
    double height = size.height;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, height);
    path.lineTo(width * 0.65, height);
    // path.lineTo(width * 0.85, 0);

    path.close();
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}