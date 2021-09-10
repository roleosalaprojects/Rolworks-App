import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rolworks_pos/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  var res;
  var body;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('POS Screen'),
            onTap: () {
              Navigator.pushNamed(context, "pos");
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Items"),
            onTap: () {
              Navigator.pushNamed(context, "items");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              res = await Network().getData('/logout');
              body = json.decode(res.body);
              if (body['success']) {
                SharedPreferences localStorage =
                    await SharedPreferences.getInstance();
                localStorage.remove('user');
                localStorage.remove('token');
                Navigator.pushNamed(context, "/");
              }
            },
          ),
        ],
      ),
    );
  }
}
