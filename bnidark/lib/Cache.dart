// ignore_for_file: file_names

import 'package:hive_flutter/hive_flutter.dart';

import 'DataObjects/User.dart';

class Cache {
  static Future<void> saveUser(User user) async {
    var box = await Hive.openBox('user');
    box.put('user', user);
    box.close();
  }

  static Future<User?> getUser() async {
    var box = await Hive.openBox<User>('user');
    User? user = box.get('user');
    box.close();
    return user;
  }
}
