import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

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
}