// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, file_names, unused_import, prefer_const_constructors

import 'package:bnidark/Accuiel.dart';
import 'package:bnidark/prfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'MyAppStorage.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );

    // Center(
    //     child: Text("Welcome " + MyAppStorage.of(context)!.user.name)));
  }
}
