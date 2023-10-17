// ignore_for_file: unnecessary_overrides, unused_local_variable, unnecessary_null_comparison, unnecessary_cast, prefer_if_null_operators, unused_import, override_on_non_overriding_member

import 'package:bnidark/Utils.Language/local_storage/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLanguage extends GetxController {
  var appLocal = 'AR';
  bool applocalebool = true;
  @override
  void onInit() async {
    super.onInit();
    LocalStorage localStorage = LocalStorage();
    if (applocalebool = await localStorage.languageSelected == null) {
      appLocal = 'AR';
    } else {
      await localStorage.languageSelected;
      update();
      Get.updateLocale(Locale(appLocal));
    }
  }

  void changedLanguage(String type) async {
    LocalStorage localStorage = LocalStorage();

    if (appLocal == type) {
      return;
    }
    if (type == 'AR') {
      appLocal = 'AR';
      localStorage.saveLanguageToDisk('AR');
    } else if (type == 'AN') {
      appLocal = 'AN';
      localStorage.saveLanguageToDisk('AN');
    } else {
      appLocal = 'FR';
      localStorage.saveLanguageToDisk('FR');
    }
    update();
  }
}
