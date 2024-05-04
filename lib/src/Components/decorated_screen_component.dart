import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Constants/colors.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';

class DecoratedScreenComponent extends StatelessWidget {
  
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;

  const DecoratedScreenComponent({ 
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.children,
  });

  @override
  Widget build(BuildContext context){
    final userBloc = Get.find<UserBloc>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (AppBar().preferredSize.height + userBloc.padding.value.top);
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          const Dibujo(
            painter: CuadroUno(color: Palette.green1),
          ),
          const Dibujo(
            painter: CuadroDos(color: Palette.beige2 )
          ),
          Positioned(
            top: 0,
            left: 0,
            width: width,
            height: height * 0.78,
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            )
          ),
        ],
      ),
    );
  }

  
}

class Dibujo extends StatelessWidget {

  final CustomPainter painter;

  const Dibujo({
    super.key,
    required this.painter
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
    return true;
  }
}