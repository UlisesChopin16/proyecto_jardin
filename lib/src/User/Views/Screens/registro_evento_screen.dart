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
          )
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
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              right: 15,
                              bottom: 0,
                              child: Image.asset(
                                'assets/images/logo_inah.png',
                                color: Colors.black.withOpacity(0.2),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 30),
                              child: Text(
                                '¿Te gustaría recibir novedádes y eventos próximos del jardín?',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
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