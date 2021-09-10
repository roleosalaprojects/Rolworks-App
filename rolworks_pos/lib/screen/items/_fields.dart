import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rolworks_pos/network/api.dart';
import 'package:rolworks_pos/app_utils/Parser.dart';

class ItemFields extends StatefulWidget {
  final String id;
  const ItemFields({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _ItemFieldsState createState() => _ItemFieldsState();
}

class _ItemFieldsState extends State<ItemFields> {
  var item;
  var categories;
  var suppliers;
  var taxes;
  var units;
  var itemStores;

  final barcode = TextEditingController();
  final name = TextEditingController();

  @override
  void initState() {
    _getItemDetails();
    super.initState();
  }

  Future<void> _getItemDetails() async {
    var res = await Network().getData("/items/" + widget.id);
    var body = json.decode(res.body);
    setState(() {
      item = body["item"];
      categories = body["categories"];
      suppliers = body["suppliers"];
      taxes = body["taxes"];
      units = body["units"];
      itemStores = body["item_stores"];
      print(categories);

      barcode.text = item["barcode"].toString();
      name.text = item["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Barcode",
              hintText: "Barcode",
            ),
            controller: barcode,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Name",
            ),
            controller: name,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
        )
      ],
    );
  }
}
