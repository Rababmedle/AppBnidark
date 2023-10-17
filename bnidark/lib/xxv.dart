// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'FirstScreen.dart';
import 'login_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => StartState();
// }

// class StartState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // ignore: todo
//
//     super.initState();
//     startTime();
//   }

//   startTime() async {
//     var duration = const Duration(seconds: 4);
//     return Timer(duration, route);
//   }

//   route() {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => LoginScreen()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return initWidget(context);
//   }

//   Widget initWidget(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 22, 22, 21),
//                 gradient: LinearGradient(colors: const [
//                   (Color.fromARGB(255, 14, 13, 13)),
//                   Color.fromARGB(255, 19, 18, 18)
//                 ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//           ),
//           Center(
//             child: Image.network(
//                 "https://th.bing.com/th/id/OIP.X0SESMmr_gpf_1lGTMCvQQHaHj?pid=ImgDet&w=193&h=196&c=7"),
//           )
//         ],
//       ),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // initState
    super.initState();
    Timer(Duration(seconds: 110), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => FirstScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logon.jpg',
              height: 150,
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Bni-Dark',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
