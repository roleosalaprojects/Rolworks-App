import 'package:flutter/material.dart';

List<Widget> itemList(var json) {
  List<Widget> list = [];
  for (var $item in json) {
    list.add(Text("Name: " + $item["name"]));
  }
  return list;
}
