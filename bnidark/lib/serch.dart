import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (val) => initiateSearch(val),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: name != "" && name != null
              ? FirebaseFirestore.instance
                  .collection('Expertd')
                  .where("nom", arrayContains: name)
                  .snapshots()
              : FirebaseFirestore.instance.collection("Expertd").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}'.tr);
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...'.tr);
              default:
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot docs) {
                    return new ListTile(
                      title: new Text(docs['nom']),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
    );
  }

  void initiateSearch(String val) {
    setState(() {
      name = val.toLowerCase().trim();
    });
  }
}
