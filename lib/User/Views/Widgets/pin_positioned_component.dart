import 'package:flutter/material.dart';


class PinPositionedComponent extends StatelessWidget {

  final double top;
  final double left;
  final double widthImage = 500 * 1.416;
  final double heightImage = 500;

  // tamaño del redPin, solo se debe el 0.043
  static const double redPin = 500 * 0.043;

  // tamaño del pin de prueba 
  // No se debe de mover este dato
  final double sizePin = 30;


  final int number;


  const PinPositionedComponent({
    super.key,
    required this.top,
    required this.left,
    required this.number,
  });


   /*
   * Este metodo sirve para:
   * - Centrar el redPin con base en la posición en Y de la imagen y el largo del pin de prueba (sizePin)
   * - En caso de que el redPin cresca, con este metodo evitaremos que se mueva de la posicion en Y
   */
  getPointYPin({
    required double size,
  }){
    // obtenemos la posición en Y del pin de prueba en base a la posición de la imagen
    // restamos el tamaño del pin de prueba con el redPin para centrar la punta del pin en la posición Y
    double pinY = (sizePin - redPin) - 0.5;

    // dividimos la posición Y del pin entre el alto de la imagen para obtener el porcentaje de la posición en Y del pin de prueba
    // sumamos el resultado a la posición en Y del pin de prueba
    size += pinY / heightImage;

    // multiplicamos el resultado por el alto de la imagen para obtener la posición en Y del redPin en la imagen
    return heightImage * size;
  }


  /*
   * Este metodo sirve para:
   * - Centrar el redPin con base en la posición en X de la imagen y el ancho del pin de prueba (sizePin)
   * - En caso de que el redPin cresca, con este metodo evitaremos que se mueva se mueva de la posicion en X
   */
  getPointXPin({
    required double size,
  }){
    // obtenemos la posición en X del pin de prueba en base a la posición de la imagen
    // restamos el tamaño del pin de prueba con el redPin ambos los dividimos entre 2 para centrar la punta del pin en la posición X
    double pinX = (sizePin / 2) - (redPin / 2);

    // dividimos la posición X del pin entre el ancho de la imagen para obtener el porcentaje de la posición en X del pin de prueba
    // sumamos el resultado a la posición en X del pin de prueba
    size += pinX / widthImage;

    // multiplicamos el resultado por el ancho de la imagen para obtener la posición en X del redPin en la imagen
    return widthImage * size;
  }

  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: getPointYPin(size: top), 
      left: getPointXPin(size: left),
      child: InkWell(
        onTap: () {
          print('top: $top, left: $left, number: $number');
        },
        child: const Icon(
          Icons.location_on,
          color: Colors.red,
          size: redPin,
        )
      ),
    );
  }
}