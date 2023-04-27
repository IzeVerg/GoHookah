import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
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
        onPressed: () {},
        label: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 17, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class CardQuery {
  static const String baseUrl = "https://gohookah.ilavista.tech/api/places";
  //здесь создавать статические константы для фильтров через слэш

}

class Pictures {
  static CacheManager pictureCache =
  CacheManager(Config('placesImg', stalePeriod: const Duration(days: 7)));
}



class TxtButton extends StatelessWidget {
  final String txt;
  const TxtButton({
    super.key,
    required this.txt
  });

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
      child: Text(txt,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15, fontWeight: FontWeight.w400),
      ),
    );
  }
}




