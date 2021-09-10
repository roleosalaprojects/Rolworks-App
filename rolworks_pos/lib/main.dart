import 'package:flutter/material.dart';
import 'package:rolworks_pos/app_utils/routes.dart' as utils;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    title: "Rolworks POS",
    routes: utils.namedroutes(),
  ));
}
