import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';
import 'package:proyecto_jardin/src/User/Views/Widgets/list_images_component.dart';

class AcercadeView extends StatelessWidget {

  const AcercadeView({Key? key});

  static const List<String> nombreImagenes = [
    'logotipo',
    'logo_principal',
    'logo_inah',
    'inahmor',
    'logo_cid',
    'logo_conahcyt-H',
    'renajeb_logo',
  ];

  @override
  Widget build(BuildContext context) {
    final userBloc = Get.find<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Acerca De'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.public),
            onPressed: (){
              // agregar aquí la url
              userBloc.abrirUrl(context, 'https://www.inah.gob.mx/interactivos/recorridos-virtuales');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(// Permite que el DecoratedScreenComponent ocupe todo el espacio vertical restante en la pantalla
            child: DecoratedScreenComponent(
              child: ListImagesComponent(
                nombreImagenes: nombreImagenes,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
            'Versión: 1.0.0', // Nombre de la versión real de la aplicación
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
