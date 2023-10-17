// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:bnidark/Cache.dart';
import 'package:bnidark/DataObjects/User.dart';
import 'package:bnidark/FirstScreen.dart';
import 'package:bnidark/MyAppStorage.dart';
import 'package:bnidark/RegisterScreen.dart';
import 'package:bnidark/Translations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'controller/app_language.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  Hive.registerAdapter(UserAdapter());

  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScree(),
      translations: Translation(),
      locale: Locale('AR'),
      fallbackLocale: Locale('AR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User? user;
  void login(User user) {
    setState(() {
      this.user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
      init: AppLanguage(),
      builder: (controller) {
        return Directionality(
          textDirection: controller.appLocal == 'AR'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Navigator(pages: [
            if (user == null)
              MaterialPage(
                child: FutureBuilder<User?>(
                    future: Cache.getUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        user = snapshot.data;
                        return MyAppStorage(
                            user: snapshot.data!, child: FirstScreen());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return RegisterScreen(onRegister: login);
                      } else {
                        return Scaffold(
                            body: Center(child: CircularProgressIndicator()));
                      }
                    }),
              )
            else
              MaterialPage(
                  child: MyAppStorage(user: user!, child: FirstScreen()))
          ], onPopPage: (route, result) => route.didPop(result)),
        );
      },
    );
  }
}

class SplashScree extends StatefulWidget {
  const SplashScree({Key? key}) : super(key: key);

  @override
  State<SplashScree> createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScree> {
  @override
  void initState() {
    // initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.jpg',
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
