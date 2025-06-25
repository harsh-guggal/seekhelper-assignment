import 'package:flutter/material.dart';
import 'package:flutter_asignment/models/user_model.dart';

class DataProvider extends ChangeNotifier {
  List<UserModel> _allUsers = [];
  List<UserModel> _filteredUsers = [];

  List<UserModel> get allUsers => _filteredUsers;

  void setAllUser(List<UserModel> users) {
    _allUsers = users;
    _filteredUsers = users;
    notifyListeners();
  }

  void searchUser(String query) {
    if (query.isEmpty) {
      _filteredUsers = _allUsers;
    } else {
      _filteredUsers = _allUsers.where((user) {
        final name = user.name?.toLowerCase() ?? '';
        final email = user.email?.toLowerCase() ?? '';
        final username = user.username?.toLowerCase() ?? '';
        return name.contains(query.toLowerCase()) || email.contains(query.toLowerCase()) || username.contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  addUserAtTop(UserModel user) {
    allUsers.insert(0, user);
    notifyListeners();
  }
}
