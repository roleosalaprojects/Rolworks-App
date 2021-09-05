import 'package:flutter/material.dart';
import 'package:rolworks_pos/app_utils/routes.dart' as utils;

void main() {
  runApp(MaterialApp(
    title: "Rolworks POS",
    routes: utils.namedroutes(),
  ));
}
