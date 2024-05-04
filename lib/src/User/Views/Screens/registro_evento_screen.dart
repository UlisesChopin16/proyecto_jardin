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
          )
        ),
        body:  SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: userBloc.viewInsets.value,
              child: DecoratedScreenComponent(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      '¿Te gustaria recibir novedades y eventos próximos del jardín?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  const Formulario(),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}