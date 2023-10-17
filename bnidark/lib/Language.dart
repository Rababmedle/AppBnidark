// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/app_language.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String _selectedlang = 'AR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Bnidark'.tr),
        backgroundColor: Colors.deepOrange[800],
      ),
      body: Container(
        child: Directionality(
          textDirection:
              _selectedlang == 'AR'.tr ? TextDirection.rtl : TextDirection.ltr,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 290,
                  ),
                  Center(
                    child: Text(
                      "Choisisser la langage".tr,
                      style: TextStyle(
                          color: Colors.deepOrange[800],
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Expanded(
                      child: GetBuilder<AppLanguage>(
                        init: AppLanguage(),
                        builder: (controller) {
                          return DropdownButton<String>(
                            items: [
                              DropdownMenuItem(
                                child: Text("AR".tr),
                                value: 'AR',
                              ),
                              DropdownMenuItem(
                                child: Text("FR".tr),
                                value: 'FR',
                              ),
                              DropdownMenuItem(
                                child: Text("AN".tr),
                                value: 'AN',
                              ),
                            ],
                            value: controller.appLocal,
                            onChanged: (value) {
                              controller.changedLanguage(value.toString());
                              Get.updateLocale(Locale(value.toString()));
                            },
                            iconSize: 90,
                            iconEnabledColor: Colors.deepOrange[800],
                            dropdownColor: Colors.deepOrange[800],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}