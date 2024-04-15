import 'package:flutter/material.dart';
import 'package:proyecto_jardin/Constants/colors.dart';
import 'package:proyecto_jardin/User/Views/Screens/acercade_screen.dart';
import 'package:proyecto_jardin/User/Views/Screens/Escaner/escanear_screen.dart';
import 'package:proyecto_jardin/User/Views/Screens/inicio_screen.dart';
import 'package:proyecto_jardin/User/Views/Screens/recorrido_virtual_screen.dart';
import 'package:proyecto_jardin/User/Views/Screens/registro_evento_screen.dart';
import 'package:proyecto_jardin/User/Views/Widgets/drawer_item_component.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({ Key? key }) : super(key: key);

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {

  double _width = 0.0;
  double _height = 0.0;

  int _selectedIndex = 0;

  InicioView inicioView = const InicioView();
  RecorridoVirtualView recorridoVirtualView = const RecorridoVirtualView();
  EscanearView escanearView = const EscanearView();
  RegistroEventoView registroEventoView = const RegistroEventoView();
  AcercadeView acercadeView = const AcercadeView();

  // This method is used to get the screen size
  void _getScreenSize() {
    setState(() {
      _width = MediaQuery.of(context).size.width;
      _height = MediaQuery.of(context).size.height;
    });
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return inicioView;
        // return escanearView;
      case 1:
        return recorridoVirtualView;
      case 2:
        return escanearView;
      case 3:
        return registroEventoView;
      case 4:
        return acercadeView;
      default:
        return inicioView;
    }

  }
 
  @override
  Widget build(BuildContext context) {
    _getScreenSize();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal'),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF004A33),
        width: _width * 0.8,
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  'MENU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Palette.beige3,
            ),
            const SizedBox(height: 10.0),
            drawerItemComponent(
              title: 'Inicio',
              icon: Icons.home,
              index: 0,
            ),
            drawerItemComponent(
              title: 'Recorrido virtual',
              icon: Icons.map,
              index: 1
            ),
            drawerItemComponent(
              title: 'Escanear QR plantas',
              icon: Icons.qr_code,
              index: 2
            ),
            drawerItemComponent(
              title: 'Registro para eventos',
              icon: Icons.event,
              index: 3,
            ),
            drawerItemComponent(
              title: 'Acerca de nosotros',
              icon: Icons.info,
              index: 4,
            ),
          ],
        ),
      ),
      body: _getScreen(_selectedIndex),
    );
  } 

  drawerItemComponent({
    required String title,
    required IconData icon,
    required int index,
  }) {
    return DrawerItemComponent(
      title: title,
      icon: icon,
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.of(context).pop();
      },
    );
  }

}