// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
  runApp(const SplashScree());
}

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
    Timer(Duration(seconds: 10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 60, 34),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logon.jpg',
              height: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Bni-Dark',
              style: TextStyle(color: Colors.blue),
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
