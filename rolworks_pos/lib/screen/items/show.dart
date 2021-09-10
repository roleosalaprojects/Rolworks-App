import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rolworks_pos/app_utils/const.dart';
import 'package:rolworks_pos/network/api.dart';
import 'package:rolworks_pos/screen/items/_fields.dart';

class ItemShowScreen extends StatefulWidget {
  final String id;
  final String name;

  const ItemShowScreen({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  _ItemShowScreenState createState() => _ItemShowScreenState();
}

class _ItemShowScreenState extends State<ItemShowScreen> {
  var item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDef(widget.name),
      body: ItemFields(
        id: widget.id,
      ),
    );
  }
}
