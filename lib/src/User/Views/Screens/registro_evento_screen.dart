import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Components/button_component.dart';
import 'package:proyecto_jardin/src/Components/decorated_screen_component.dart';
import 'package:proyecto_jardin/src/Constants/colors.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';

class RegistroEventoView extends StatelessWidget {
  const RegistroEventoView({ super.key });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      body:  DecoratedScreenComponent(
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
          SizedBox(height: height * 0.15),
          const Formulario(),
        ],
      )
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  final userBloc = Get.find<UserBloc>();

  String correo = '';

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Form(
      child: Container(
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
              onPressed: () async {
                
                // print(correo);
              },
            )
          ],
        ),
      ),
    );
  }
}