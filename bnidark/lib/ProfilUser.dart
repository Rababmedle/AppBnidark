// ignore_for_file: file_names, prefer_const_constructors

import 'package:bnidark/MyAppStorage.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 226, 226),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      MyAppStorage.of(context)!.user.name,
                      style: TextStyle(
                        color: Color.fromARGB(255, 241, 77, 7),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
