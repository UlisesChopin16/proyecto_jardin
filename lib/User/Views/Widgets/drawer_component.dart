import 'package:flutter/material.dart';
import 'package:proyecto_jardin/Constants/colors.dart';
import 'package:proyecto_jardin/User/Views/Widgets/drawer_item_component.dart';

class DrawerComponent extends StatelessWidget {
  final List<Widget> views;
  final Function(int) onTapDrawer;
  final double width;

  const DrawerComponent({
    Key? key,
    required this.views,
    required this.onTapDrawer,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF004A33),
      width: width * 0.8,
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
          ...List.generate(
            views.length,
            (index) => DrawerItemComponent(
              title: _getTitleDrawerItem(index),
              icon: _getViewIcon(index),
              onTap: () => onTapDrawer(index),
            ),
          ),
        ],
      ),
    );
  }

  String _getTitleDrawerItem(int index) {
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

  IconData _getViewIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.map;
      case 2:
        return Icons.qr_code;
      case 3:
        return Icons.event;
      case 4:
        return Icons.info;
      default:
        return Icons.home;
    }
  }
}
