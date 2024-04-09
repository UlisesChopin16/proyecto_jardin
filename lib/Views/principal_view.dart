import 'package:flutter/material.dart';
import 'package:proyecto_jardin/Components/drawer_item_component.dart';
import 'package:proyecto_jardin/Constants/colors.dart';
import 'package:proyecto_jardin/Views/acercade_view.dart';
import 'package:proyecto_jardin/Views/escanear_view.dart';
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

  // This method is used to get the screen size
  void _getScreenSize() {
    setState(() {
      _width = MediaQuery.of(context).size.width;
      _height = MediaQuery.of(context).size.height;
    });
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
          children: const [
            SizedBox(
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
            Divider(
              color: Palette.beige3,
            ),
            SizedBox(height: 10.0),
            DrawerItemComponent(
              title: 'Inicio',
              icon: Icons.home,
              page: PrincipalView(),
            ),
            DrawerItemComponent(
              title: 'Recorrido virtual',
              icon: Icons.map,
              page: RecorridoVirtualView(),
            ),
            DrawerItemComponent(
              title: 'Escanear QR plantas',
              icon: Icons.qr_code,
              page: EscanearView(),
            ),
            DrawerItemComponent(
              title: 'Registro para eventos',
              icon: Icons.event,
              page: RegistroEventoView(),
            ),
            DrawerItemComponent(
              title: 'Acerca de nosotros',
              icon: Icons.info,
              page: AcercadeView(),
            ),
          ],
        ),
      ),
      
    );
  } 
}