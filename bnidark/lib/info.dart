import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bnidark/profile.dart';
import 'package:get/get.dart';

import 'AjoutExpert.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[800],
        title: Text('List Expert'.tr),
      ),
      body: DS(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddPage(),
                fullscreenDialog: true,
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class gh extends StatefulWidget {
  const gh({Key? key}) : super(key: key);

  @override
  State<gh> createState() => _ghState();
}

class _ghState extends State<gh> {
  // // List items = [];
  // // CollectionReference mihref = FirebaseFirestore.instance.collection("Expertd");
  // // getdata() async {
  // //   var reponse = await mihref.get();
  // //   for (var element in reponse.docs) {
  // //     setState(() {
  // //       items.add(element.data());
  // //     });
  // //   }
  // // }

  // @override
  // // void initState() {
  // //   getdata();
  // //   // TODO: implement initState
  // //   super.initState();
  // // }

  String mihne = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Card(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search....'.tr),
              onChanged: (val) {
                setState(() {
                  mihne = val;
                });
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: (mihne != "" && mihne != null)
                ? FirebaseFirestore.instance
                    .collection('Expertd')
                    .where("Mihne", arrayContains: mihne)
                    .snapshots()
                : FirebaseFirestore.instance.collection('Expertd').snapshots(),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.waiting)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data!.docs[index];
                        return Text(data['Mihne'.tr]);
                      });
            }));
  }
}
