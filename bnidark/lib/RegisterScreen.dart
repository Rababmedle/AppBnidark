// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_prefixes, unnecessary_new, avoid_print, file_names

import 'package:bnidark/Cache.dart';
import 'package:bnidark/utilities/SMSCodeDialog.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'DataObjects/User.dart';

class RegisterScreen extends StatefulWidget {
  final Function(User) onRegister;

  RegisterScreen({required this.onRegister});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = new TextEditingController();

  final TextEditingController nameController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Auth.FirebaseAuth auth = Auth.FirebaseAuth.instance;
  String _countryCode = "+222";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E3E8),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 4,
                child: Image.asset('assets/logo.jpg'),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                              labelText: "",
                              labelStyle: TextStyle(
                                  fontSize: 8, color: Colors.transparent)),
                          value: _countryCode,
                          onChanged: (String? newValue) {
                            _countryCode = newValue ?? "+222";
                          },
                          // ignore: prefer_const_literals_to_create_immutables
                          items: [
                            DropdownMenuItem<String>(
                              value: "+222",
                              child: Text("+222"),
                            ),
                            DropdownMenuItem<String>(
                              value: "+20",
                              child: Text("+20"),
                            ),
                            DropdownMenuItem<String>(
                              value: "+1",
                              child: Text("+1"),
                            ),
                          ]),
                    ),
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration:
                            InputDecoration(labelText: "Phone Number".tr),
                        validator: (value) {
                          String pattern = r'(^(?:[+0]9)?[0-9]{8,12}$)';
                          RegExp regExp = new RegExp(pattern);

                          if (value!.isEmpty) {
                            return "Please enter your phone number".tr;
                          }
                          if (!regExp.hasMatch(value)) {
                            return "Please enter a valid phone number".tr;
                          }

                          return null;
                        },
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: "Name".tr),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name".tr;
                          }
                          if (value.length < 3) {
                            return "Name is too Short".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
              Spacer(flex: 2),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () => onPressed(context),
                      child: Text("Register".tr))),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    String phone = phoneController.text;
    String name = nameController.text;

    if (_formKey.currentState!.validate()) {
      Auth.FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _countryCode + phone,
        timeout: Duration(seconds: 120),
        verificationCompleted: (Auth.PhoneAuthCredential credential) {
          print("it is valid".tr);
        },
        verificationFailed: (Auth.FirebaseAuthException e) {
          print("failed".tr);

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        },
        codeSent: (String verificationId, int? resendToken) async {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return SMSCodeDialog(
                    phoneNumber: _countryCode + phone,
                    resendToken: resendToken,
                    onSMSCodeEntered: (smsCode, dialogContext) async {
                      try {
                        Auth.PhoneAuthCredential credential =
                            Auth.PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: smsCode);
                        Auth.UserCredential userCre =
                            await auth.signInWithCredential(credential);

                        Auth.User firebaseUser = userCre.user!;

                        User user = User(name, firebaseUser.phoneNumber!,
                            firebaseToken: firebaseUser.uid);
                        Cache.saveUser(user);
                        widget.onRegister(user);
                        Navigator.of(dialogContext).pop();
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Wrong sms code".tr)));
                      }
                    });
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("timeout".tr);
        },
      );
    }
  }
}
