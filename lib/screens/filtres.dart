import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_hookah_app/mini-moments/button.dart';
import 'package:go_hookah_app/notification/notif_about_location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FiltresAndLocation extends StatefulWidget {
  const FiltresAndLocation({Key? key}) : super(key: key);

  @override
  State<FiltresAndLocation> createState() => _FiltresAndLocationState();
}

class _FiltresAndLocationState extends State<FiltresAndLocation> {
  bool _isVisible = true;
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: ModalScrollController.of(context),
      child: Container(
        constraints:
            BoxConstraints.loose(Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.95)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 14, 10, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ButtonBack(),
                  const Text("Фильтрация",
                      style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 18, fontWeight: FontWeight.w600)),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Сбросить",
                        style: TextStyle(color: Color(0xFFFFC107), fontSize: 18, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 35, 16, 0),
              child: GestureDetector(
                onTap: () {
                  showMaterialModalBottomSheet(
                    barrierColor: const Color(0xff333333),
                    closeProgressThreshold: 0.6,
                    useRootNavigator: true,
                    bounce: true,
                    isDismissible: true,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                    backgroundColor: const Color(0xff2B2B2B),
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return const ShowModal();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.locationDot,
                          color: Color(0xFF767676),
                          size: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Выберите локацию',
                            style: TextStyle(
                              color: Color(0xFF767676),
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF767676),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
              child: Container(
                height: 2,
                width: double.infinity,
                color: const Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                'Открыто до',
                style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 116,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('Круглосуточно', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    height: 32,
                    width: 55,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('18:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    height: 32,
                    width: 55,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('19:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('20:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('21:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('22:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    height: 32,
                    width: 55,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('23:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    height: 32,
                    width: 55,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('00:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('01:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('02:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),
                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('03:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('04:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    height: 32,
                    width: 55,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('05:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    height: 32,
                    width: 55,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('06:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.grey)))),
                      child: const Text('07:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),

                  SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('08:00', style: TextStyle(color: Color(0xFFF6F7FB), fontSize: 13)),
                    ),
                  ),
                  Visibility(
                    visible: _isVisible,
                  child: SizedBox(
                    width: 55,
                    height: 32,
                    child: TextButton(
                      onPressed: () {
                        _isVisible = !_isVisible;
                        setState(() {

                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Color(0xFFFFC107)),
                          ),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('+ Ещё', style: TextStyle(color: Color(0xFFFFC107), fontSize: 13)),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
