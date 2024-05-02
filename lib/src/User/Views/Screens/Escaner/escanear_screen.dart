import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Components/button_component.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/Escaner/info_plantas_screen.dart';

class EscanearView extends StatefulWidget {
  const EscanearView({ super.key });

  @override
  State<EscanearView> createState() => _EscanearViewState();
}

class _EscanearViewState extends State<EscanearView> {

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
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InfoPlantasScreen(),
        settings: RouteSettings(
          arguments: {
            'qrCode': qrCode
          }
        )
      )
      
    );
  }

  @override
  Widget build(BuildContext context) {
    getSize();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Escanear código QR'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: DecoratedScreenComponent(
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
      )
    );
  }
}