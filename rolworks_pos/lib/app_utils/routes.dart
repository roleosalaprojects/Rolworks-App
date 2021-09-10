import 'package:flutter/material.dart';
import 'package:rolworks_pos/screen/login_screen.dart';
import 'package:rolworks_pos/screen/pos_screen.dart';
import 'package:rolworks_pos/screen/items/index.dart';
import 'package:rolworks_pos/screen/register.dart';

Map<String, Widget Function(BuildContext)> namedroutes() {
  return {
    '/': (context) => LoginScreen(),
    'pos': (context) => POSScreen(),
    'items': (context) => ItemScreen(),
    'register': (context) => RegisterScreen(),
  };
}
