import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';
import 'package:proyecto_jardin/src/User/Views/Widgets/list_images_component.dart';

class AcercadeView extends StatelessWidget {

  const AcercadeView({ super.key });

  static const List<String> nombreImagenes =[
    'logotipo',
    'logo_principal',
    'inahmor',
    'logo_cid',
    'logo_conahcyt-H',
    'logo_inah',
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
              userBloc.abrirUrl(context, 'url');
            },
          ),
        ],
      ),
      body: const DecoratedScreenComponent(
        child: ListImagesComponent(
          nombreImagenes: nombreImagenes,
        ),
      )
    );
  }
}