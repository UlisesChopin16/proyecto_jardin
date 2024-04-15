import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class UserBloc extends GetxController {

  Future<String> escanearCodigo() async {
    String qrCode = '';
    try {
      qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000',
        'Cancelar',
        true,
        ScanMode.QR
      );
    } catch (e) {
      qrCode = e.toString();
    }
    return qrCode;
  }

}