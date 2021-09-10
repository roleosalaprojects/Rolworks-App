import 'package:flutter/material.dart';

List<Widget> itemList(var json) {
  List<Widget> list = [];
  for (var $item in json) {
    var price = double.parse($item["price"].toString());
    var cost = double.parse($item["cost"].toString());
    var margin = double.parse($item["markup"].toString());
    if (price <= 0) {
      price = price + (cost * (margin / 100));
    }
    List<Widget> sub_list = [];
    sub_list.add(Container(
      child: OutlineButton(
        padding: EdgeInsets.all(10.0),
        onPressed: () {
          print($item['id']);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              $item["name"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              $item["price"].toString(),
            ),
          ],
        ),
      ),
    ));

    list.addAll(sub_list);
  }
  return list;
}
