import 'package:flutter/material.dart';
import 'package:proyecto_jardin/Components/drawer_item_component.dart';
import 'package:proyecto_jardin/Constants/colors.dart';
import 'package:proyecto_jardin/Views/acercade_view.dart';
import 'package:proyecto_jardin/Views/escanear_view.dart';
import 'package:proyecto_jardin/Views/inicio_view.dart';
import 'package:proyecto_jardin/Views/recorrido_virtual_view.dart';
import 'package:proyecto_jardin/Views/registro_evento_view.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({ Key? key }) : super(key: key);

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {

  double _width = 0.0;
  double _height = 0.0;

  int _selectedIndex = 0;

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
        return const InicioView();
      case 1:
        return const RecorridoVirtualView();
      case 2:
        return const EscanearView();
      case 3:
        return const RegistroEventoView();
      case 4:
        return const AcercadeView();
      default:
        return const PrincipalView();
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