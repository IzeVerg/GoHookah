import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_hookah_app/mini-moments/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const keyIsFirstLoaded = 'is_first_loaded';

List<String> city = ["Минск", "Могилев", "Гомель", "Брест", "Гродно", "Витебск", "Барановичи", "Бобруйск"];

List<String> country = ["Беларусь", "Германия", "Грузия", "Испания", "Литва", "Польша", "Россия", "Украина"];

String town = "";

Color? textColor3 = const Color(0xFFF6F7FB);

Color? textColor4 = const Color(0xFFFFC107);

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

String? currentAddress;

showDialogIfFirstLoaded(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
  _determinePosition();
  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark placeMark = newPlace[0];

    currentAddress = placeMark.locality;

    town = currentAddress!;
  });

  if (isFirstLoaded == null && currentAddress != null) {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          title: Text("Ваш город $currentAddress?",
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
                    showMaterialModalBottomSheet(
                      barrierColor: const Color(0xff333333),
                      closeProgressThreshold: 0.6,
                      useRootNavigator: true,
                      bounce: true,
                      isDismissible: true,
                      shape:
                          const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                      backgroundColor: const Color(0xff2B2B2B),
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return const ShowModal();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class ShowModal extends StatefulWidget {
  const ShowModal({Key? key}) : super(key: key);

  @override
  State<ShowModal> createState() => _ShowModalState();
}

class _ShowModalState extends State<ShowModal> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: ModalScrollController.of(context),
      child: Container(
        constraints:
            BoxConstraints.loose(Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.95)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 14, 16, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2B2B2B),
                        side: BorderSide.none,
                      ),
                      onPressed: () {
                        showMaterialModalBottomSheet(
                          barrierColor: const Color(0xff333333),
                          closeProgressThreshold: 0.6,
                          useRootNavigator: true,
                          bounce: true,
                          isDismissible: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                          backgroundColor: const Color(0xff2B2B2B),
                          context: context,
                          builder: (context) => StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                            return SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: ModalScrollController.of(context),
                              child: Container(
                                constraints: BoxConstraints.loose(
                                    Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.95)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 2),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          ButtonBack(),
                                          Text("Страна",
                                              style: TextStyle(
                                                  color: Color(0xFFF6F7FB), fontSize: 18, fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 90,
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: TextField(
                                          style: const TextStyle(
                                            height: 24 / 17,
                                            color: Colors.white,
                                          ),
                                          controller: _searchController,
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(0),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(13),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xff333333),
                                            hintText: 'Поиск',
                                            hintStyle: const TextStyle(
                                              color: Color(0xFF767676),
                                              fontSize: 17,
                                            ),
                                            suffixIcon: IconButton(
                                              iconSize: 18,
                                              color: const Color(0xFF767676),
                                              icon: const Icon(Icons.clear),
                                              onPressed: () => _searchController.clear(),
                                            ),
                                            prefixIcon: IconButton(
                                              padding: const EdgeInsetsDirectional.only(start: 0.0, end: 0.0),
                                              iconSize: 25,
                                              color: const Color(0xFF767676),
                                              icon: const Icon(Icons.search),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: country.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => ListTile(
                                        title: Text(country[index], style: TextStyle(color: textColor3, fontSize: 17)),
                                        onTap: () {
                                          setState(() {});
                                        },
                                      ),
                                      separatorBuilder: (context, index) {
                                        return const Divider(height: 0, color: Colors.white10);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      },
                      label: const Text("Страна",
                          style: TextStyle(color: Color(0xFFFFC107), fontSize: 18, fontWeight: FontWeight.w400)),
                      icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFFFFC107))),
                  const Text("Город",
                      style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 18, fontWeight: FontWeight.w600)),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Применить",
                        style: TextStyle(color: Color(0xFFFFC107), fontSize: 18, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  style: const TextStyle(
                    height: 24 / 17,
                    color: Colors.white,
                  ),
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    filled: true,
                    fillColor: const Color(0xff333333),
                    hintText: 'Поиск',
                    hintStyle: const TextStyle(
                      color: Color(0xFF767676),
                      fontSize: 17,
                    ),
                    suffixIcon: IconButton(
                      iconSize: 18,
                      color: const Color(0xFF767676),
                      icon: const Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                    prefixIcon: IconButton(
                      padding: const EdgeInsetsDirectional.only(start: 0.0, end: 0.0),
                      iconSize: 25,
                      color: const Color(0xFF767676),
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: city.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: Text(city[index], style: TextStyle(color: textColor3, fontSize: 17)),
                onTap: () {
                  town = city[index];
                  setState(() {});
                },
              ),
              separatorBuilder: (context, index) {
                return const Divider(height: 0, color: Colors.white10);
              },
            ),
          ],
        ),
      ),
    );
  }
}
