
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecorridoVirtualView extends StatefulWidget {
  const RecorridoVirtualView({Key? key}) : super(key: key);

  @override
  _RecorridoVirtualViewState createState() => _RecorridoVirtualViewState();
}

class _RecorridoVirtualViewState extends State<RecorridoVirtualView> {
  double width = 0;
  double height = 0;
  double widthImage = 0;
  double heightImage = 0;

  double top = 0;
  double left = 0;

  // tamaño del pin de prueba 
  // No se debe de mover este dato
  final double sizePin = 30;

  // tamaño del redPin con base en el alto de la imagen
  double redPin = 0;

  @override
  void initState() {
    super.initState();
    // Establecer la orientación horizontal al entrar en la vista de Recorrido Virtual
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Restaurar la orientación vertical al salir de la vista de Recorrido Virtual
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _getScreenSize() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }


  getPointPositionImage(double x, double y) {
    // obtener la posición de la imagen en base a la posición de en que se encuentra el pin de prueba
    double xImage = x / widthImage;
    double yImage = y / heightImage;

    // imprimir la posición en la imagen con los datos para solo copiar y pegar en el widget pinPositioned
    print('top: getPointYPin(size: $yImage), left: getPointXPin(size: $xImage),' );
  }

  /*
   * Este metodo sirve para:
   * - Centrar el redPin con base en la posición en Y de la imagen y el largo del pin de prueba (sizePin)
   * - En caso de que el redPin cresca, no se mueva de la posicion en Y
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
   * - En caso de que el redPin cresca, no se mueva de la posicion en X
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
    _getScreenSize();
    heightImage = height;
    // obtener el ancho de la imagen en base a la relación de aspecto de la imagen (x = 3897, y = 3656) => x/y = 1.065
    widthImage = heightImage * 1.065;

    redPin = heightImage * 0.03;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: InteractiveViewer(

            child: SizedBox(
              height: height,
              width: width,
              child: Center(
                child: GestureDetector(
                  onPanUpdate: (details){
                    setState(() {
                      top = details.localPosition.dy;
                      left = details.localPosition.dx;
                    });
                    getPointPositionImage(top, left);
                  },
                  child: Container(
                    width: widthImage,
                    height: heightImage,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/map.png',),
                        fit: BoxFit.fill,
                      )
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        
                        pinPositioned(
                          top: heightImage * 0.22038099500868058, left: widthImage * 0.21676111253670916, 
                          number: 1
                        ),
                        pinPositioned(
                          top: getPointYPin(size: 0.3111097547743056), left: getPointXPin(size: 0.8360916873378381), 
                          number: 2
                        ),
                        pinPrueba(
                          top: top,
                          left: left, 
                          
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  pinPositioned({
    required double top,
    required double left,
    required int number,
  }){
    return Positioned(
      top: top,
      left: left,
      child: InkWell(
        onTap: () {
          print('top: $top, left: $left, number: $number');
        },
        child: Icon(
          Icons.location_on,
          color: Colors.red,
          size: redPin,
        )
      ),
    );
  }

  pinPrueba({
    required double top,
    required double left,
  }){
    return Positioned(
      top: top,
      left: left,
      child: InkWell(
        onTap: () {
          print('top: $top, left: $left');
        },
        child: const Icon(
          Icons.location_on,
          color: Colors.blue,
          size: 30,
        )
      ),
    );
  }

  
}
