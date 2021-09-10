import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rolworks_pos/app_utils/const.dart';
import 'package:rolworks_pos/network/api.dart';
import 'package:rolworks_pos/screen/side_menu.dart';
import 'package:rolworks_pos/screen/items/show.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final searchText = TextEditingController();

  List<String> _items = ['No Item/s Found'];
  List<String> _price = [''];
  List<int> _id = [0];

  void _getItems() async {
    var item = await Network().getData("/items");
    var body = json.decode(item.body);
    setState(() {
      _items = [];
      _price = [];
      _id = [];
      for (var item in body) {
        List<String> list = [];
        _id.add(item["id"]);
        _items.add(item["name"]);
        _price.add(item["price"].toString());
      }
      // _items = body;
    });
  }

  void _getItemSearch(String key) async {
    var item = await Network().getData("/items/search/$key");
    var body = json.decode(item.body);
    print(body);
    setState(() {
      _items = [];
      _price = [];
      _id = [];
      for (var item in body) {
        List<String> list = [];
        _id.add(item["id"]);
        _items.add(item["name"]);
        _price.add(item["price"].toString());
      }
    });
  }

  @override
  void initState() {
    _getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDef("Items"),
      drawer: NavDrawer(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                ),
                controller: searchText,
                onChanged: (text) {
                  setState(() {
                    _getItemSearch(text);
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10.0),
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return OutlineButton(
                      borderSide: BorderSide.none,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemShowScreen(
                              id: _id[index].toString(),
                              name: _items[index],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: Text(_items[index][0]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(_items[index]),
                          ),
                          // SizedBox(
                          //   width: 10.0,
                          //   child: Text(" - "),
                          // ),
                          // Text(_price[index]),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
