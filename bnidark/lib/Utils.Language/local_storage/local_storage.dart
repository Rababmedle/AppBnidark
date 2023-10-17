// ignore_for_file: await_only_futures

import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  //write
  void saveLanguageToDisk(String language) async {
    await GetStorage().write('lang'.tr, language);
  }

  //Read
  Future<String?> get languageSelected async {
    return await GetStorage().read('lang');
  }
}
