import 'package:flutter/material.dart';
import 'Geolocator/get_current_location_user.dart';
import 'main_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
