import 'package:flutter/material.dart';
import 'package:bnidark/AffichSoc.dart';
import 'package:bnidark/AfficheMatr.dart';
import 'package:bnidark/InscriUtilisateur.dart';
import 'package:bnidark/buying.dart';

import 'package:bnidark/info.dart';
import 'package:bnidark/ls3ar.dart';
import 'package:bnidark/mm.dart';
import 'package:bnidark/profile.dart';
import 'package:bnidark/serch.dart';
import 'package:bnidark/terrain.dart';
import 'package:bnidark/xxv.dart';
import 'package:get/get.dart';

import 'Accuiel.dart';
import 'AffichExpert.dart';

class MakeDashboardItems extends StatefulWidget {
  const MakeDashboardItems({Key? key}) : super(key: key);

  @override
  _MakeDashboardItemsState createState() => _MakeDashboardItemsState();
}

class _MakeDashboardItemsState extends State<MakeDashboardItems> {
  Card makeDashboardItem(String title, String img, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(10),
      child: Container(
        decoration: index == 45 || index == 24 || index == 12
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [
                    Color(0xFF004B8D),
                    Color(0xFFffffff),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                  )
                ],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 97, 34),
                    blurRadius: 15,
                    offset: Offset(2, 2),
                  )
                ],
              ),
        child: InkWell(
          onTap: () {
            if (index == 0) {}
            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => s3r(),
                  ));
            }
            if (index == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => him(),
                  ));
              //3.item

            }
            if (index == 3) {
              //4.item
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => soc(),
                  ));
            }
            if (index == 4) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => mtr(),
                  ));
            }
            if (index == 5) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tr(),
                  ));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Image.asset(
                  img,
                  height: 90,
                  width: 190,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(216, 67, 21, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 110),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                makeDashboardItem(
                    "Tarifs  journaliers".tr, "assets/logo.png", 1),
                makeDashboardItem("Experts".tr, "assets/MC1.jpg", 2),
                makeDashboardItem(
                    "matériaux de construction".tr, "assets/MB.jpg", 3),
                makeDashboardItem(
                    "équipement de construction".tr, "assets/CC.jpg", 4),
                makeDashboardItem(
                    "Terrain à vendre".tr, "assets/tterin.jpeg", 5),
                makeDashboardItem("Informations".tr, "assets/info.jpeg", 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
