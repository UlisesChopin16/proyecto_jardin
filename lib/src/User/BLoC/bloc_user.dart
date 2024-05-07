import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:proyecto_jardin/src/User/Views/Widgets/snackbar_component.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserBloc extends GetxController {

  var isLoading = false.obs;

  var viewInsets = EdgeInsets.zero.obs;
  var padding = EdgeInsets.zero.obs;


  Future<String> escanearCodigo() async {
    String qrCode = '';
    try {
      isLoading.value = true;
      qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000',
        'Cancelar',
        true,
        ScanMode.QR
      );
    } catch (e) {
      qrCode = e.toString();
    } finally {
      isLoading.value = false;
    }
    return qrCode;
  }

  // metodo para leer un archivo de texto y retornar un mapa
  Future<Map<String,String>> leerArchivo(String archivo) async {
    Map<String,String> mapa = {};
    try {
      isLoading.value = true;

      // Lee el archivo de texto
      String contenido = await rootBundle.loadString('assets/files/$archivo.txt');
      mapa = await Isolate.run(() async{
        // Dividir el contenido en líneas
        List<String> lineas = contenido.split('\n');

        Map<String,String> datos = {};
        // Iterar sobre cada línea y agregar al mapa
        for (String linea in lineas) {
          List<String> partes = linea.split(':');
          if (partes.length == 2) {
            String clave = partes[0].trim();  
            String valor = partes[1].trim();
            datos[clave] = valor;
          }
        }
        return datos;
      });
    } catch (e) {
      mapa['error'] = e.toString();
    } finally {
      isLoading.value = false;
    }
    return mapa;
  }

  // metodo para abrir una url
  Future<void> abrirUrl(BuildContext context,String url, ) async {
    try {
      isLoading.value = true;
      if (await canLaunchUrlString(url)) {
        await launchUrlString(
          url,
          mode: LaunchMode.platformDefault,
        );
      } else {
        if(!context.mounted)return;
        SnackBarComponent(context).snackBarError('Intenta de nuevo más tarde');
      }
    } catch (e) {
      if(!context.mounted)return;
      if(e.toString().contains('Failed host lookup')){
        SnackBarComponent(context).snackBarError('No se pudo conectar con el servidor, intenta de nuevo más tarde');
      }else if(e.toString().contains('Connection failed')){
        SnackBarComponent(context).snackBarError('La conexión falló, intenta de nuevo más tarde');
      }else if(e.toString().contains('SocketException')) {
        SnackBarComponent(context).snackBarError('Hubo un error de conexión, intenta de nuevo más tarde');
      }else{
        // verificamos que haya conexión a internet
        SnackBarComponent(context).snackBarError('Intenta de nuevo más tarde');
        isLoading.value = false;
      }
    }
  }
}