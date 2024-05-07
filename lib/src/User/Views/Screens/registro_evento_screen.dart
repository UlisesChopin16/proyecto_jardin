import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';
import 'package:proyecto_jardin/src/User/Views/Widgets/formulario_component.dart';

class RegistroEventoView extends StatelessWidget {

  const RegistroEventoView({ super.key });


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final userBloc = Get.find<UserBloc>();
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Registro para eventos'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        body:  SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: userBloc.viewInsets.value,
              child: DecoratedScreenComponent(
                heightChild: height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        height: height < 650 ? 60 : 100,
                        'assets/images/logo_inah.png',
                        color: Colors.black.withOpacity(0.2),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        '¿Te gustaría recibir novedádes y eventos próximos del jardín?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: height < 650 ? 24 : 28,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const Formulario(),
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}