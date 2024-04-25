import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_jardin/src/User/Views/Widgets/pin_positioned_component.dart';

class RecorridoVirtualView extends StatefulWidget {
  const RecorridoVirtualView({super.key});

  @override
  State<RecorridoVirtualView> createState() => _RecorridoVirtualViewState();
}

class _RecorridoVirtualViewState extends State<RecorridoVirtualView> {
  double width = 0;
  double height = 0;
  final double widthImage = 500 * 1.416;
  final double heightImage = 500;

  double top = 0;
  double left = 0;

  // tamaño del redPin con base en el alto de la imagen
  double redPin = 0;

  // Lista de pines
  static const List<Widget> listOfPins = [
                            
    PinPositionedComponent(
      top: 0.8082415825497787, 
      left: 0.5708053790018833,
      number: 1,
    ),
    PinPositionedComponent(
      top: 0.6312612347898231, 
      left: 0.5728804705598054, 
      number: 2,
    ),
    PinPositionedComponent(
      top: 0.5860196003871683, 
      left: 0.5860634051630753, 
      number: 3,
    ),
    PinPositionedComponent(
      top: 0.5427548568860621, 
      left: 0.5388652442377881, 
      number: 4,
    ),
    PinPositionedComponent(
      top: 0.5437595063606195, 
      left: 0.47217749789593855,
      number: 5,
    ),
    PinPositionedComponent(
      top: 0.6135664408185841, 
      left: 0.447195023061347,
      number: 6,
    ),
    PinPositionedComponent(
      top: 0.6647063398783186, 
      left: 0.4965089636143194,
      number: 7,
    ),
    PinPositionedComponent(
      top: 0.6184924640486725, 
      left: 0.40691383399580033,
      number: 8,
    ),
    PinPositionedComponent(
      top: 0.6706046045353983, 
      left: 0.3770487907896272,
      number: 9,
    ),
    PinPositionedComponent(
      top: 0.6184924640486725, 
      left: 0.2916445323567155,
      number: 10,
    ),
    PinPositionedComponent(
      top: 0.709915566233407, 
      left: 0.30832664095961876,
      number: 11,
    ),
    PinPositionedComponent(
      top: 0.7522080683075221, 
      left: 0.33957507853773977,
      number: 12,
    ),
    PinPositionedComponent(
      top: 0.7600832238661506, 
      left: 0.39511429376447854,
      number: 13,
    ),
    PinPositionedComponent(
      top: 0.7620277067201329, 
      left: 0.461761352036565,
      number: 14,
    ),
    PinPositionedComponent(
      top: 0.8338115320796461, 
      left: 0.5055010270319817,
      number: 15,
    ),
    PinPositionedComponent(
      top: 0.5122912921736725, 
      left: 0.597171248208423,
      number: 16,
    ),
    PinPositionedComponent(
      top: 0.43953522538716816, 
      left: 0.6048206053239006,
      number: 17,
    ),
    PinPositionedComponent(
      top: 0.3569271121404867, 
      left: 0.6333022541581256,
      number: 18,
    ),
    PinPositionedComponent(
      top: 0.3313571626106195, 
      left: 0.6485602803193175,
      number: 19,
    ),
    PinPositionedComponent(
      top: 0.2792450221238938, 
      left: 0.6478685831333435,
      number: 20,
    ),
    PinPositionedComponent(
      top: 0.2576288543971239, 
      left: 0.6138533568113264,
      number: 21,
    ),
    PinPositionedComponent(
      top: 0.276295889795354, 
      left: 0.5839883136051531,
      number: 22,
    ),
    PinPositionedComponent(
      top: 0.3412092090707965, 
      left: 0.6075873940677967,
      number: 23,
    ),
    PinPositionedComponent(
      top: 0.3579317616150443, 
      left: 0.5721887733738313,
      number: 24,
    ),
    PinPositionedComponent(
      top: 0.44838262237278764, 
      left: 0.5145337785194074,
      number: 25,
    ),
    PinPositionedComponent(
      top: 0.4778739456581859, 
      left: 0.41802167704114807,
      number: 27,
    ),
    PinPositionedComponent(
      top: 0.4011965051161505, 
      left: 0.40760553118177434,
      number: 28,
    ),
    PinPositionedComponent(
      top: 0.36383002627212396, 
      left: 0.4950848811726081,
      number: 29,
    ),
    PinPositionedComponent(
      top: 0.30481497165376104, 
      left: 0.4965089636143194,
      number: 30,
    ),
    PinPositionedComponent(
      top: 0.23205890486725667, 
      left: 0.5145337785194074,
      number: 31,
    ),
    PinPositionedComponent(
      top: 0.2890970685840708, 
      left: 0.42843782290052174,
      number: 32,
    ),
    PinPositionedComponent(
      top: 0.2576288543971239, 
      left: 0.38331475353315664,
      number: 33,
    ),
    PinPositionedComponent(
      top: 0.21141497856747787, 
      left: 0.42148016297101815,
      number: 34,
    ),
    PinPositionedComponent(
      top: 0.166173344164823, 
      left: 0.3944225965785044,
      number: 35,
    ),
    PinPositionedComponent(
      top: 0.2153363523230089, 
      left: 0.31805108963301837,
      number: 36,
    ),
    PinPositionedComponent(
      top: 0.23698492809734512, 
      left: 0.25832100322067225,
      number: 37,
    ),
    PinPositionedComponent(
      top: 0.1946924260232301, 
      left: 0.2124655485975701,
      number: 38,
    ),
    PinPositionedComponent(
      top: 0.20353982300884957, 
      left: 0.16319229611436095,
      number: 39,
    ),
    PinPositionedComponent(
      top: 0.27039762513827437, 
      left: 0.15415954462693532,
      number: 40,
    ),
    PinPositionedComponent(
      top: 0.26550400995575224, 
      left: 0.19859091680832627,
      number: 41,
    ),
    PinPositionedComponent(
      top: 0.37857568791482304, 
      left: 0.15277615025498728,
      number: 42,
    ),
    PinPositionedComponent(
      top: 0.35300573838495575, 
      left: 0.19582412806443014,
      number: 43,
    ),
    PinPositionedComponent(
      top: 0.3628253767975664, 
      left: 0.25136334329116883,
      number: 44,
    ),
    PinPositionedComponent(
      top: 0.4237849142699115, 
      left: 0.19928261399430025,
      number: 45,
    ),
    PinPositionedComponent(
      top: 0.4699987900995576, 
      left: 0.2527467376631169,
      number: 46,
    ),
    PinPositionedComponent(
      top: 0.5280091952433629, 
      left: 0.17845032227555288,
      number: 47,
    ),
    PinPositionedComponent(
      top: 0.5722785882190266, 
      left: 0.22080660289902174,
      number: 48,
    ),
    PinPositionedComponent(
      top: 0.585047358960177, 
      left: 0.14996867344132792,
      number: 49,
    ),
    PinPositionedComponent(
      top: 0.676502869192478, 
      left: 0.1451267931395097,
      number: 50,
    ),
    PinPositionedComponent(
      top: 0.6912485308351771, 
      left: 0.2124655485975701,
      number: 51,
    ),
    PinPositionedComponent(
      top: 0.7708751037057523, 
      left: 0.12636959297868436,
      number: 52,
    ),
    PinPositionedComponent(
      top: 0.7630323561946903, 
      left: 0.23748871150192494,
      number: 53,
    ),
    
  ];

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

  // Descomentar estas lineas en caso de querer poscicionar nuevos pines con el pin de prueba
  // getPointPositionImage(double x, double y) {
  //   // obtener la posición de la imagen en base a la posición de en que se encuentra el pin de prueba
  //   double xImage = x / widthImage;
  //   double yImage = y / heightImage;

  //   // imprime la posición en la imagen con los datos para solo copiar y pegar en el widget PinPositioned
  //   print('PinPositionedComponent(\n  top: $yImage,\n  left: $xImage,\n  number: ${listOfPins.length},\n),' );
  // }

  getScreenSize(){
    // obtenemos el ancho y alto de la pantalla
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
  

  @override
  Widget build(BuildContext context) {

    getScreenSize();

    redPin = heightImage * 0.043;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: InteractiveViewer(
              maxScale: 6,
              minScale: 1,
              boundaryMargin: const EdgeInsets.all(double.infinity),
              child: SizedBox(
                width: width,
                height: height,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: heightImage,
                      maxWidth: widthImage,
                    ),
                    child: GestureDetector(
                      // Descomentar estas lineas en caso de querer poscicionar nuevos pines con el pin de prueba
                      // onPanUpdate: (details){
                      //   setState(() {
                      //     top = details.localPosition.dy;
                      //     left = details.localPosition.dx;
                      //   });
                      //   getPointPositionImage(left, top);
                      // },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/map.png',),
                            fit: BoxFit.fill,
                          )
                        ),
                        child: const Stack(
                          alignment: Alignment.center,
                          // comentar esta linea en caso de querer poscicionar nuevos pines con el pin de prueba
                          children: listOfPins

                          // Descomentar estas lineas en caso de querer poscicionar nuevos pines con el pin de prueba
                          // Para posicionar un nuevo pin rojo, importa solo la punta de abajo del pin de prueba
                          // children: [
                          //   pinPrueba(
                          //     top: top,
                          //     left: left, 
                          //   ),
                          // ],
                        ),
                      ),
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

  // Descomentar estas lineas en caso de querer poscicionar nuevos pines con el pin de prueba
  // pinPrueba({
  //   required double top,
  //   required double left,
  // }){
  //   return Positioned(
  //     top: top,
  //     left: left,
  //     child: InkWell(
  //       onTap: () {
  //         print('top: $top, left: $left');
  //       },
  //       child: const Icon(
  //         Icons.location_on,
  //         color: Colors.blue,
  //         size: 30,
  //       )
  //     ),
  //   );
  // }

}
