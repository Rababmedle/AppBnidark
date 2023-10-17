import 'package:bnidark/ls3ar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';

import 'AjoutExpert.dart';

class Addtr extends StatefulWidget {
  const Addtr({Key? key}) : super(key: key);

  @override
  State<Addtr> createState() => _AddtrState();
}

class _AddtrState extends State<Addtr> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const emailRegex = r"""^(2|3|4)[0-9]{7}""";
  final nom = TextEditingController();
  final num = TextEditingController();
  final adres = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[800],
        title: Text('Inscription'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          bottom: 80,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ajoutez les détails du terrain à vendre avec le prix et le numéro de téléphone'
                    .tr
                    .tr,
                style: TextStyle(color: Colors.deepOrange[800], fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nom,
                decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.deepOrange[800]),
                    hintText: "Nom".tr,
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "coloone vide".tr;
                  } else if (value.length < 4) {
                    return "entrer un Nom qui contient quatre letre ou plus".tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: num,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone, color: Colors.deepOrange[800]),
                    hintText: "Numero".tr,
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (RegExp(emailRegex).hasMatch(value!)) {
                  } else if (value == null || value.isEmpty) {
                    return "coloone vide".tr;
                  } else {
                    return "Numero incorrect".tr;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: adres,
                decoration: InputDecoration(
                    icon: Icon(Icons.local_atm_outlined,
                        color: Colors.deepOrange[800]),
                    hintText: "Adress".tr,
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "coloone vide".tr;
                  } else if (value.length < 4) {
                    return "entrer un Nom qui contient quatre letre ou plus".tr;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 14,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseFirestore.instance.collection('tterain').add({
                      'nom': nom.value.text,
                      'Prix': num.value.text,
                      'phone': adres.value.text,
                      'timeStamp': DateTime.now(),
                    });
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Inscription avec succes'.tr),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).popUntil(
                                      (route) => route.isFirst,
                                    );
                                  },
                                  child: Text("OK".tr))
                            ],
                          );
                        });
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => WelcomePage()));

                  } else {
                    return null;
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange[800],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Inscrir".tr,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
