import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rolworks_pos/network/api.dart';
import 'package:rolworks_pos/app_utils/const.dart';
import 'package:rolworks_pos/app_utils/json_handler.dart';

class POSScreen extends StatefulWidget {
  const POSScreen({Key? key}) : super(key: key);

  @override
  _POSScreenState createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  var _items;

  void getItems() async {
    var item = await Network().getData("/items");
    var body = json.decode(item.body);
    _items = body;
    print(body);
  }

  @override
  void initState() {
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDef("Rolworks POS"),
      body: Center(
        child: ListView(
          children: itemList(_items),
        ),
      ),
    );
  }
}
