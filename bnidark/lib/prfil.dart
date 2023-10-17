// ignore_for_file: file_names, prefer_const_constructors

import 'package:bnidark/MyAppStorage.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class prfil extends StatefulWidget {
  const prfil({Key? key}) : super(key: key);

  @override
  State<prfil> createState() => _prfilState();
}

class _prfilState extends State<prfil> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.864,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[800],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Text(
                      "Bnidark".tr,
                      style: TextStyle(
                          color: Color.fromARGB(255, 5, 4, 4),
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/log.png',
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      'Welcome'.tr + MyAppStorage.of(context)!.user.name,
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 4, 4),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Text(
                      "Your Number".tr +
                          MyAppStorage.of(context)!.user.phoneNumber,
                      style: TextStyle(
                          color: Color.fromARGB(255, 5, 4, 4),
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
