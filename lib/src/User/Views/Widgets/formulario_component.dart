import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/Components/button_component.dart';
import 'package:proyecto_jardin/src/Constants/colors.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final userBloc = Get.find<UserBloc>();

  String correo = '';

  void onChanged(String? value) {
    setState(() {
      correo = value!;
    });
  }

  String? validation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo requerido';
    }else if (!value.isEmail) {
      return 'Correo invalido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        width: width,
        height: height * 0.28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Palette.beige1
        ),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: width,
              height: height * 0.32,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '¡Registrate para estar enterado de todo!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextFormField(
                    onChanged: onChanged,
                    validator: validation,
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
                      if (formKey.currentState!.validate()) {
                        print(correo);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}