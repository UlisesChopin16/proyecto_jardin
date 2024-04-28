import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Components/button_component.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';
import 'package:proyecto_jardin/src/extension_route.dart';

class EscanearContentScreen extends StatefulWidget {
  const EscanearContentScreen({ super.key });

  @override
  State<EscanearContentScreen> createState() => _EscanearContentScreenState();
}

class _EscanearContentScreenState extends State<EscanearContentScreen> {

  final userBloc = Get.put(UserBloc());

  double width = 0;
  double height = 0;

  getSize(){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  Future<void> _scanQR() async {

    String qrCode = await userBloc.escanearCodigo();

    if(!context.mounted)return;
    
    context.toNamed(
      '/escanear/infoPlantas', 
      arguments: {
        'qrCode': qrCode
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    getSize();
    return Scaffold(
      body: DecoratedScreenComponent(
        changeColors: true,
        child: Center(
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/codigo-qr.gif'),
                      fit: BoxFit.cover
                    )
                  ),
                  width: height * 0.3,
                  height: height * 0.3,
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonComponent(
                  text: 'Escanear',
                  onPressed: _scanQR,
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}