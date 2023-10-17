import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bnidark/profile.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import 'AjoutExpert.dart';

class s3r extends StatelessWidget {
  const s3r({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
        backgroundColor: Colors.deepOrange[800],
        title: Text('Tarifs  journaliers'.tr),
      ),
      body: Affich(),
    );
  }
}

class Affich extends StatefulWidget {
  const Affich({Key? key}) : super(key: key);

  @override
  State<Affich> createState() => _AffichState();
}

class _AffichState extends State<Affich> {
  final Stream<QuerySnapshot> _exper =
      FirebaseFirestore.instance.collection('Prix').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _exper,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong'.tr);
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading".tr);
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: FittedBox(
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                        child: Row(children: <Widget>[
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(
                                right: 40, left: 50, bottom: 10),
                            height: 90,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange[800],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        data['nom'],
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 80,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        data['prix'].toString(),
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      Text('MRU')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]))));
          }).toList(),
        );
      },
    );
  }
}
