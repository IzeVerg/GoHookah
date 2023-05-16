import 'package:flutter/material.dart';
import 'package:go_hookah_app/models/modal.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MainCardModel? dataLoadingState;

  MapScreen({this.dataLoadingState, Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(53.896060, 27.558483),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    final MainCardModel? data = widget.dataLoadingState;
    Set <Marker> markersShop = {};
    if (data != null && data!.results != null && data!.results!.isNotEmpty) {
      for (var element in data!.results!) {
        final double lat = element.lat as double;
        final double lon = element.lon as double;
        markersShop.add(
          Marker(
            markerId: MarkerId("${element.id ?? 0}"),
            position: LatLng(
              lat,
              lon,
            ),
          ),
        );
      }
    }
    return Scaffold(
      body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          markers: markersShop,
      ),
    );
  }
}
