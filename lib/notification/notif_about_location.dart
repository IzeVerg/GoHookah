import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Position? _currentPosition;

final keyIsFirstLoaded = 'is_first_loaded';

String? _currentAddress;

Future<Position> _determinePosition() async {
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

  return await Geolocator.getCurrentPosition();
}


showDialogIfFirstLoaded(BuildContext context) async {
  _determinePosition();
  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
    _currentPosition = position;
  });
  _getAddressFromLatLng();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
  if (isFirstLoaded == null && _currentAddress != null) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          title: Text("Ваш город $_currentAddress?",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20)),
          content: const Text("Вы всегда сможете изменить Ваш город в настройках профиля.",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15)),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(Colors.amber),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: const Text("Подтвердить",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 18)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    prefs.setBool(keyIsFirstLoaded, true);
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: const Text("Изменить",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18)),
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

_getAddressFromLatLng() async {
  List<Placemark> placemarks =
  await placemarkFromCoordinates(_currentPosition!.latitude, _currentPosition!.longitude);

  Placemark place = placemarks[0];

  _currentAddress = "${place.locality}";
}




