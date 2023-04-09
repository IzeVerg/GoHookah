import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../main_screen.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("Получить данные о местонахождении"),
                onPressed: <Position>() async {
                  bool serviceEnabled;
                  LocationPermission permission;

                  serviceEnabled = await Geolocator.isLocationServiceEnabled();
                  if (!serviceEnabled) {
                    return Future.error('Location services are disabled.');
                  }

                  permission = await Geolocator.checkPermission();
                  if (permission == LocationPermission.denied) {
                    permission = await Geolocator.requestPermission();
                    if (permission == LocationPermission.denied) {
                      return Future.error('Location permissions are denied');
                    }
                  }

                  if (permission == LocationPermission.deniedForever) {
                    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
                  }

                  // return await Geolocator.getCurrentPosition();
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Disclaimer'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text('This is app collects location data.'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => MainScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                  return;

                },),
          ],
        ),
      ),
    );
  }
}
