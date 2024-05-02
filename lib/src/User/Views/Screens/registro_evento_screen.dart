import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Components/button_component.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';
import 'package:proyecto_jardin/src/Constants/colors.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';

class RegistroEventoView extends StatefulWidget {
  const RegistroEventoView({ super.key });

  @override
  State<RegistroEventoView> createState() => _RegistroEventoViewState();
}

class _RegistroEventoViewState extends State<RegistroEventoView> {

  final userBloc = Get.put(UserBloc());

  String correo = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Acerca De'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          )
        ),
        body:userBloc.isLoading.value ? const Center(child: CircularProgressIndicator(),) : DecoratedScreenComponent(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
                width: width,
                height: height * 0.2,
                child: const Text(
                  '¿Te gustaria recibir novedades y eventos próximos del jardín?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              width: width,
              height: height * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Palette.beige1
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    '¡Registrate para estar enterado de todo!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextFormField(
                    onChanged: (value){
                      setState(() {
                        correo = value;
                      });
                    },
                    decoration:   InputDecoration(
                      hintText: 'E-mail',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black
                        )
                      ),
                      border: Theme.of(context).inputDecorationTheme.border,
                    ),
                  ),
                  ButtonComponent(
                    text: 'Registrarme',
                    onPressed: ()async{
                      await userBloc.leerArchivo('prueba');
                      // print(correo);
                    },
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}