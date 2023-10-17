// ignore_for_file: file_names, unused_import

import 'package:bnidark/Utils.Language/AN.dart';
import 'package:bnidark/Utils.Language/AR.dart';
import 'package:bnidark/Utils.Language/FR.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'AR': AR,
        'FR': FR,
        'AN': AN,
      };
}
