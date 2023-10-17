import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bnidark/profile.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import 'AjouMtr.dart';
import 'AjoutExpert.dart';

Future<void> makecall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'fgng';
  }
}

class mtr extends StatelessWidget {
  const mtr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[800],
        title: Text('équipement de construction'.tr),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: DS(),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 20,
        backgroundColor: Colors.deepOrange[800],
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Addmtr(),
              ));
        },
        icon: Icon(Icons.add),
        label: Text('Ajouter'.tr),
      ),
    );
  }
}

class DS extends StatefulWidget {
  const DS({Key? key}) : super(key: key);

  @override
  State<DS> createState() => _DSState();
}

class _DSState extends State<DS> {
  final Stream<QuerySnapshot> _exper =
      FirebaseFirestore.instance.collection('Madat-lbina').snapshots();
  void Addetoil(String docid, int like) {
    var newetiol = like + 1;
    try {
      FirebaseFirestore.instance.collection('Madat-lbina').doc(docid).update({
        'likes': newetiol,
      }).then((value) => print('donne'));
    } catch (e) {
      print(e.toString());
    }
  }

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
            var B = data['num'];
            void makewtsp() async {
              String vr = data['num'];

              await launch('https://wa.me/$vr?text=cv');
            }

            return Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, top: 15, left: 10, right: 10),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(4, 4),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(-4, -4),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 100,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.deepOrange[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          data['type'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                data['nom'],
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Text(
                              data['phone'],
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                              ),
                            ),
                            // IconButton(
                            //     onPressed: () => makecallS('tel:$B'),
                            //     icon: Icon(Icons.phone)),
                            // IconButton(
                            //   onPressed: () => makewtsp(),
                            //   icon: const Icon(Icons.whatsapp),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  color: Colors.deepOrange[800],
                                  padding: const EdgeInsets.only(
                                      bottom: 48, top: 0, left: 20, right: 10),
                                  onPressed: () => makecallS('tel:$B'),
                                  icon: Icon(
                                    Icons.phone,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  color: Colors.deepOrange[800],
                                  padding: const EdgeInsets.only(bottom: 48),
                                  onPressed: () => makewtsp(),
                                  icon: Icon(
                                    Icons.whatsapp,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            //   Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: <Widget>[
                            //       IconButton(

                            //         onPressed: () => makecallS('tel:$B'),
                            //         icon: Icon(Icons.phone),
                            //       ),
                            //     ],
                            //   ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//     return Padding(
//       padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
//       child: Container(
//         height: 30,
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.red,
//               offset: Offset(4, 4),
//               blurRadius: 10,
//               spreadRadius: 1,
//             ),
//             BoxShadow(
//               color: Colors.white,
//               offset: Offset(-4, -4),
//               blurRadius: 10,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.red,
//                       offset: Offset(4, 4),
//                       blurRadius: 10,
//                       spreadRadius: 1,
//                     ),
//                     BoxShadow(
//                       color: Colors.white,
//                       offset: Offset(-4, -4),
//                       blurRadius: 10,
//                       spreadRadius: 1,
//                     ),
//                   ],
//                 ),
//                 height: 60,
//                 width: 60,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Image.asset('assets/CC.jpg'),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         'name',
//                         style: TextStyle(
//                           color: Colors.grey[900],
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       ' symbol',
//                       style: TextStyle(
//                         color: Colors.grey[900],
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     'price.',
//                     style: TextStyle(
//                       color: Colors.grey[900],
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'sdc',
//                     style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'gty',
//                     style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     );
//   }
// }