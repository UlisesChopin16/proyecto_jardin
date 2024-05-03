import 'package:flutter/material.dart';

class SnackBarComponent {
  final BuildContext context;
  const SnackBarComponent(this.context);

  snackBarSuccess(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }  

  snackBarError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
        duration: const Duration(seconds: 3),
      )
    );
  }

  snackBarLoading(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.grey,
        content: Text('Cargando...'),
        duration: Duration(seconds: 3),
      ),
    );
  }


}