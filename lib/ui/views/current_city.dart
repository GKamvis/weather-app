// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// class CityNameScreen extends StatefulWidget {
//   @override
//   _CityNameScreenState createState() => _CityNameScreenState();
// }

// class _CityNameScreenState extends State<CityNameScreen> {
//   String _cityName = 'Fetching city...';

//   @override
//   void initState() {
//     super.initState();
//     _getCityName();
//   }

//   Future<void> _getCityName() async {
//     // Check if location services are enabled
//     bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isLocationServiceEnabled) {
//       setState(() {
//         _cityName = 'Location services are disabled.';
//       });
//       return;
//     }

//     // Request permission to access location
//     LocationPermission permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
//       setState(() {
//         _cityName = 'Location permission denied.';
//       });
//       return;
//     }

//     // Get current position
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

//     if (placemarks.isNotEmpty) {
//       setState(() {
//         _cityName = placemarks[0].locality ?? 'City not found';
//       });
//     } else {
//       setState(() {
//         _cityName = 'City not found';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('City Name'),
//       ),
//       body: Center(
//         child: Text(
//           _cityName,
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }