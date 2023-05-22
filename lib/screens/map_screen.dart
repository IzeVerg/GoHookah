import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_hookah_app/mini-moments/button.dart';
import 'package:go_hookah_app/models/modal.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  final MainCardModel? dataLoadingState;

  const MapScreen({this.dataLoadingState, Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(53.896060, 27.558483),
    zoom: 12.5,
  );

  String image = 'lib/assets/40x40.png';

  final List<Marker> markersShop = <Marker>[];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final MainCardModel? data = widget.dataLoadingState;
    if (data != null && data.results != null && data.results!.isNotEmpty) {
      for (var element in data.results!) {
        final double lat = double.tryParse(element.lat) ?? 0;
        final double lon = double.tryParse(element.lon) ?? 0;
        markersShop.add(
          Marker(
            markerId: MarkerId("${element.id ?? 0}"),
            position: LatLng(
              lat,
              lon,
            ),
            icon: BitmapDescriptor.fromBytes(await getImages(image, 40)),
            onTap: () => Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
                  child:
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child:
                  Card(
                    elevation: 0,
                    color: const Color(0xFF2B2B2B),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.205,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF333333),
                        border: Border.all(color: Colors.transparent, width: 0),
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                                child:
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  imageUrl: 'https://gohookah.ilavista.tech/storage/place_img_sm/${element.image}',
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text('${element.title}',
                                          style: const TextStyle(
                                              color: Color(0xFFFFC107), fontSize: 17, fontWeight: FontWeight.w600)),
                                    ),
                                    ],
                                ),
                              ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 3, 16, 0),
                                  child: Row(
                                    children: [
                                    Text(
                                      '${element.rate}',
                                      style: const TextStyle(color: Color(0xFFC5C5C5)),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Icon(Icons.star_border_sharp, color: Color(0xFFC5C5C5)),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text('${element.address}',
                                        style: const TextStyle(
                                            color: Color(0xFFF6F7FB), fontSize: 15, fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 16),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TxtButton(txt: "Открыто до 6:00"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                                onPressed: () => launch("tel://${element.phone}"),
                                                icon: const Icon(Icons.phone_outlined,
                                                    color: Color(0xFFFFC107), size: 30)),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const FaIcon(
                                                  FontAwesomeIcons.taxi,
                                                  color: Color(0xFFFFC107),
                                                  size: 30,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                ),
              ],
            ),
          ),
        );
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        markers: Set<Marker>.of(markersShop),
        mapType: MapType.normal,
      ),
    );
  }
}
