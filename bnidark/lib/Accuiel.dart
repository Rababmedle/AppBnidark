// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bnidark/AffichSoc.dart';
import 'package:bnidark/Language.dart';
import 'package:bnidark/prfil.dart';
import 'package:flutter/material.dart';

import 'package:bnidark/AffichExpert.dart';
import 'package:bnidark/cards_design.dart';
import 'package:bnidark/info.dart';
import 'package:bnidark/login_screen.dart';
import 'package:bnidark/profile.dart';
import 'package:bnidark/signup_screen.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //String _selectedlang = 'AR';
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Bnidark'.tr),
          backgroundColor: Colors.deepOrange[800],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.deepOrange[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          'Bni-Dark'.tr,
                        ),
                        textColor: Colors.black,
                      ),
                    ),
                    // CircleAvatar(
                    //   maxRadius: 100,
                    //   minRadius: 50,
                    //   child: Image.asset(
                    //     'assets/principal.jpg',
                    //     width: 200,
                    //   ),
                    // ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                leading: Icon(Icons.home),
                title: Text(
                  'Accueil'.tr,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => him(),
                      ));
                },
                leading: Icon(Icons.person),
                title: Text(
                  'Experts'.tr,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => soc(),
                      ));
                },
                leading: Icon(Icons.construction_outlined),
                title: Text(
                  'matériaux de construction'.tr,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => soc(),
                      ));
                },
                leading: Icon(Icons.question_mark),
                title: Text(
                  'questions courantes'.tr,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => him(),
                      ));
                },
                leading: Icon(Icons.info),
                title: Text(
                  'info'.tr,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Language(),
                      ));
                },
                leading: Icon(Icons.language),
                title: Text(
                  'Language'.tr,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.deepOrange[800],
              borderRadius: BorderRadius.circular(7)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: DefaultTabController(
              length: 3,
              child: TabBar(
                controller: _controller,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_outlined),
                    text: "Accueil".tr,
                  ),
                  Tab(
                    icon: Icon(Icons.person_outline_sharp),
                    text: "Profile".tr,
                  ),
                  Tab(
                    icon: Icon(Icons.feed_outlined),
                    text: "info".tr,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [MakeDashboardItems(), prfil(), SignUpScreen()],
          controller: _controller,
        ));
  }
}
