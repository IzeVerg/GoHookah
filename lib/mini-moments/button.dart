import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:async';


class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPress;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164,
      height: 40,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff333333),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        icon: Icon(icon, color: Colors.white),
        onPressed: onPress,
        label: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class CardQuery {
  static const String baseUrl = "https://gohookah.ilavista.tech/api/places";
//здесь создавать статические константы для фильтров через слэш
}

class ShopQuery {
  static const String basesUrl = "https://gohookah.ilavista.tech/api/places/shops";
}

class Pictures {
  static CacheManager pictureCache = CacheManager(Config('placesImg', stalePeriod: const Duration(days: 7)));
}

class TxtButton extends StatelessWidget {
  final String txt;

  const TxtButton({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF2B2B2B),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      onPressed: () {},
      child: Text(
        txt,
        style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
     children: const [
       Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFFFFC107), size: 20,),
       SizedBox(
         width: 4,
       ),
       Text("Назад", style: TextStyle(color: Color(0xFFFFC107), fontSize: 18, fontWeight: FontWeight.w400)),
     ],
      ));
  }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const MyAppBar({Key? key, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.110,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ButtonBack(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.145,
                ),
                const Text('Кальянная',
                    style:
                    TextStyle(color: Color(0xFFF6F7FB), fontSize: 17, fontWeight: FontWeight.w500)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.203,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(height);
}




class DelayedAction {
  factory DelayedAction() => _instance;

  DelayedAction._();

  static final DelayedAction _instance = DelayedAction._();

  static Timer? _timer;

  static void run(
      VoidCallback action, {
        Duration delay = const Duration(milliseconds: 200),
      }) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}


class MySecondAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const MySecondAppBar({Key? key, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.110,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ButtonBack(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.145,
                ),
                const Text('Магазин',
                    style:
                    TextStyle(color: Color(0xFFF6F7FB), fontSize: 17, fontWeight: FontWeight.w500)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.203,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(height);
}

