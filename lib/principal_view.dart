import 'package:flutter/material.dart';
import 'package:proyecto_jardin/User/Views/Screens/acercade_screen.dart';
import 'package:proyecto_jardin/User/Views/Screens/Escaner/escanear_screen.dart';
import 'package:proyecto_jardin/User/Views/Screens/inicio_screen.dart';
import 'package:proyecto_jardin/User/Views/Screens/recorrido_virtual_screen.dart';
import 'package:proyecto_jardin/User/Views/Screens/registro_evento_screen.dart';
import 'package:proyecto_jardin/User/Views/Widgets/drawer_component.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({Key? key}) : super(key: key);

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  late double _width;
  late double _height;

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
    onTapDrawer: onTapDrawer,
    width: _width,
  );


  void _getScreenSize() {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
  }

  onTapDrawer (int index) {
    setState(() {
      _selectedIndex = index;
      titleBar = _getViewTitle(index);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _getScreenSize();
    return Scaffold(
      appBar: AppBar(
        title: Text(titleBar),
      ),
      drawer: drawerComponent,
      body: DrawerNavigation(selectedIndex: _selectedIndex, views: _views),
    );
  }

  String _getViewTitle(int index) {
    switch (index) {
      case 0:
        return 'Inicio';
      case 1:
        return 'Recorrido virtual';
      case 2:
        return 'Escanear QR plantas';
      case 3:
        return 'Registro para eventos';
      case 4:
        return 'Acerca de nosotros';
      default:
        return 'Bienvenido';
    }
  }
  
}

class DrawerNavigation extends StatelessWidget {

  final int selectedIndex;
  final List<Widget> views;

  const DrawerNavigation({
    Key? key,
    required this.selectedIndex,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return views[selectedIndex];
  }
}


