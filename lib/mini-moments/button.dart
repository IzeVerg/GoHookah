import 'package:flutter/material.dart';

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



