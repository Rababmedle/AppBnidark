// // ignore_for_file: avoid_print, unused_import, prefer_final_fields, unnecessary_new

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:location/location.dart';

// class LocationService {
//   FirebaseService _service = FirebaseService();

//   sendLocationToDataBase(context) async {
//     Location location = new Location();
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//     _locationData = await location.getLocation();

//     DocumentReference ref = _service.db
//         .collection('sections')
//         .doc(sectionID(context))
//         .collection('subSections')
//         .doc(subSectionID(context))
//         .collection('activities')
//         .doc(activityID(context));
//     ref.update(
//       {
//         'latitude': _locationData.latitude,
//         'longitude': _locationData.longitude,
//       },
//     );
//   }

//   goToMaps(double latitude, double longitude) async {
//     String mapLocationUrl =
//         "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
//     final String encodedURl = Uri.encodeFull(mapLocationUrl);
//     if (await canLaunch(encodedURl)) {
//       await launch(encodedURl);
//     } else {
//       print('Could not launch $encodedURl');
//       throw 'Could not launch $encodedURl';
//     }
//   }
// }

// // CustomCard(
// //   onPressed: () {
// //     _locationService.goToMaps(
// //     _latitude, _longitude);
// //   },
// //   Icon: FontAwesomeIcons.searchLocation,
// //   iconColor: Colors.red,
// //   iconSize: MediaQuery.of(context).size.width / 6,
// // ),