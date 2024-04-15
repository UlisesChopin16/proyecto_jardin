
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

  @override
  Widget build(BuildContext context) {

    _getScreenSize();
    heightImage = height;
    // obtener el ancho de la imagen en base a la relación de aspecto de la imagen
    widthImage = heightImage * 1.375;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: InteractiveViewer(
            child: Stack(
              children: [
                SizedBox(
                  width: widthImage,
                  height: heightImage,
                  child: Image.asset(
                    'assets/images/map.png',
                    width: widthImage,
                    height: heightImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 91.441259765625,
                  left: 232.7119140625,
                  child: InkWell(
                    onTap: () {
                      print('x: 232.7119140625, y: 91.441259765625');
                    },
                    child: Container(
                      width: 15,
                      height: 15,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getScreenSize() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }
}
