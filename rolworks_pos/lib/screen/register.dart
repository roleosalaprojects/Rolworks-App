import 'package:flutter/material.dart';
import 'package:rolworks_pos/app_utils/const.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDef("Register"),
    );
  }
}
