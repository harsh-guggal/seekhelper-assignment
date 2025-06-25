import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_asignment/models/user_model.dart';
import 'package:flutter_asignment/provider/data_provider.dart';
import 'package:flutter_asignment/services/base_sevices.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class UserServices {
  static Future<void> fetchAllUsers(BuildContext context) async {
    List<UserModel> users = [];
    try {
      var resp = await BaseService.makeUnauthenticatedRequest("${BaseService.BASE_URL}/users", method: 'GET');
      print(resp.statusCode);
      if (resp.statusCode >= 200 && resp.statusCode < 300) {
        var data = jsonDecode(resp.body);
        data.forEach((value) {
          UserModel u = UserModel.fromJson(value);
          users.add(u);
        });
        Provider.of<DataProvider>(context, listen: false).setAllUser(users);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return;
    }
  }
}
