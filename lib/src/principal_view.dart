import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/User/BLoC/bloc_user.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/Escaner/escanear_screen.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/acercade_screen.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/inicio_screen.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/RecorridoVirtual/recorrido_virtual_screen.dart';
import 'package:proyecto_jardin/src/User/Views/Screens/registro_evento_screen.dart';
import 'package:proyecto_jardin/src/User/Views/Widgets/drawer_component.dart';
import 'package:proyecto_jardin/src/drawer_navigation.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {

  final userBloc = Get.find<UserBloc>();

  late double _width;

  int _selectedIndex = 0;

  String titleBar = 'Bienvenido';

  static const List<Widget> _views = [
    InicioView(),
    RecorridoVirtualView(),
    EscanearView(),
    RegistroEventoView(),
    AcercadeView(),
  ];

  late final DrawerComponent drawerComponent = DrawerComponent(
    views: _views,
    onTapItemDrawer: onTapItemDrawer,
    width: _width,
  );


  void _getScreenSize() {
    _width = MediaQuery.of(context).size.width;
  }

  onTapItemDrawer (int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _getScreenSize();
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    userBloc.padding.value = mediaQueryData.padding;
    userBloc.viewInsets.value = mediaQueryData.viewInsets;


    return Scaffold(
      drawer: drawerComponent,
      body: DrawerNavigation(selectedIndex: _selectedIndex, views: _views),
    );
  }

  
}


