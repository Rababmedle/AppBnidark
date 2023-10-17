import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

class Addmtr extends StatefulWidget {
  const Addmtr({Key? key}) : super(key: key);

  @override
  State<Addmtr> createState() => _AddmtrState();
}

class _AddmtrState extends State<Addmtr> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const emailRegex = r"""^(2|3|4)[0-9]{7}""";
  final nni = TextEditingController();
  final nom = TextEditingController();
  final num = TextEditingController();
  final sl = TextEditingController();
  final adres = TextEditingController();
  String? selectedValue;

  List<String> items = [
    'Machine à creuser'.tr,
    'Huîtres'.tr,
    'sol'.tr,
    'Équipement de couverture'.tr
  ];
  // CollectionReference mihref = FirebaseFirestore.instance.collection("mih");
  // getdata() async {
  //   var reponse = await mihref.get();
  //   for (var element in reponse.docs) {
  //     setState(() {
  //       items.add(element.data());
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   getdata();
  //   // TODO: implement initState
  //   super.initState();
  // }

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
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Inscrir avec ton nom numero ,adresse  le type de votre équipement'
                    .tr,
                style: TextStyle(color: Colors.deepOrange[800], fontSize: 18),
              ),
              SizedBox(
                height: 30,
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
                height: 8,
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
                height: 5,
              ),
              TextFormField(
                controller: adres,
                decoration: InputDecoration(
                    icon: Icon(Icons.location_city_outlined,
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
                height: 5,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    'Select Type d équipement'.tr,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                      validator:
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "coloone vide".tr;
                        }
                      };
                    });
                  },
                  buttonHeight: 38,
                  buttonWidth: 140,
                  itemHeight: 40,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseFirestore.instance.collection('Madat-lbina').add({
                      'nni': nni.value.text,
                      'nom': nom.value.text,
                      'phone': num.value.text,
                      'sl': sl.value.text,
                      'timeStamp': DateTime.now(),
                      'adres': adres.value.text,
                      'type': selectedValue,
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
                  height: 40,
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

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Welcome".tr),
      ),
    );
  }
}
