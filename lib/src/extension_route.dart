import 'package:flutter/material.dart';

extension RouterContext on BuildContext {

  toNamed(String routeName, {Object? arguments}) { 
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
  
}