import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_hookah_app/mini-moments/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/modal.dart';


class HookahCard extends StatelessWidget {
  final CardModel? cardModel;

   HookahCard({this.cardModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: const MyAppBar(
                  height: 150,
                ),
                backgroundColor: const Color(0xFF2B2B2B),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: [
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.255,
                        width: MediaQuery.of(context).size.width * 0.9,
                         child:
                            CachedNetworkImage(
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              imageUrl: 'https://gohookah.ilavista.tech/storage/place_img_sm/${cardModel?.image}',
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                        ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 20, 15, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Минск, Беларусь',
                                    style:
                                        TextStyle(color: Color(0xFFC5C5C5), fontSize: 15, fontWeight: FontWeight.w300),
                                  ),
                                  Row(
                                    children: [
                                      Text('${cardModel?.rate}', style: const TextStyle(color: Color(0xFFC5C5C5))),
                                      const Icon(Icons.star_border_sharp, color: Color(0xFFC5C5C5), size: 17),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
                              child: TextButton(
                                onPressed: () =>
                                Clipboard.setData(ClipboardData(text: "${cardModel?.title}")).then((value){
                                  final snackBar = SnackBar(
                                    elevation: 6.0,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    backgroundColor: Colors.black.withOpacity(0.75),
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.fromLTRB(16, 0, 15, 105),
                                    dismissDirection: DismissDirection.none,
                                    duration: const Duration(seconds: 2),
                                    content:
                                     const Text('Название заведения скопировано.', style: TextStyle(color: Color
                                       (0xFFF5F5F5), fontSize: 15, fontWeight: FontWeight.w400)),

                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                                ),
                                child: Text ('${cardModel?.title}',
                                  style: const TextStyle(
                                      color: Color(0xFFFFC107), fontSize: 34, fontWeight: FontWeight.w600)),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 12, 15, 24),
                              child: Text('${cardModel?.description}',
                                  style: const TextStyle(
                                      color: Color(0xFFC5C5C5), fontSize: 15, fontWeight: FontWeight.w300)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child:
                             Container(
                              height: 2,
                              color: const Color(0xFF333333),
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
                              child:
                            SizedBox(
                              height: 100,
                              child:
                            ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 100,
                                  width: 100,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF333333),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                              width: 8,
                            ),
                            ),
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child:
                              Container(
                                height: 2,
                                color: const Color(0xFF333333),
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                              child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      const Text("Контактная информация", style: TextStyle(
                                  color: Color(0xFFF6F7FB),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                )),
                                      const SizedBox(
                                        height: 17,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on_outlined, color: Color(0xFF767676)),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text('Адрес:', style: TextStyle(color: Color(0xFF767676),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),),
                                          TextButton(
                                              onPressed: () =>
                                                  Clipboard.setData(ClipboardData(text: "${cardModel?.address}")).then((value){
                                                    final snackBar = SnackBar(
                                                      elevation: 6.0,
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(20))),
                                                      backgroundColor: Colors.black.withOpacity(0.75),
                                                      behavior: SnackBarBehavior.floating,
                                                      margin: const EdgeInsets.fromLTRB(16, 0, 15, 105),
                                                      dismissDirection: DismissDirection.none,
                                                      duration: const Duration(seconds: 2),
                                                      content:
                                                      const Text('Адрес скопирован.', style: TextStyle
                                                        (color: Color
                                                        (0xFFF5F5F5), fontSize: 15, fontWeight: FontWeight.w400)),

                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                  }
                                                  ),
                                              child: Text('${cardModel?.address}', style:
                                          const TextStyle(color: Color(0xFFF6F7FB), fontSize: 17, fontWeight: FontWeight
                                              .w400))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.phone_rounded, color: Color(0xFF767676)),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text('Телефон:', style: TextStyle(color: Color(0xFF767676),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),),
                                          TextButton(
                                              onPressed: () =>
                                                  Clipboard.setData(ClipboardData(text: "${cardModel?.phone}")).then((value){
                                                    final snackBar = SnackBar(
                                                      elevation: 6.0,
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(20))),
                                                      backgroundColor: Colors.black.withOpacity(0.75),
                                                      behavior: SnackBarBehavior.floating,
                                                      margin: const EdgeInsets.fromLTRB(16, 0, 15, 105),
                                                      dismissDirection: DismissDirection.none,
                                                      duration: const Duration(seconds: 2),
                                                      content:
                                                      const Text('Телефон скопирован.', style: TextStyle(color: Color
                                                        (0xFFF5F5F5), fontSize: 15, fontWeight: FontWeight.w400)),

                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                  }
                                                  ),
                                              child: Text('${cardModel?.phone}', style:
                                          const TextStyle(color: Color(0xFFFFC107), fontSize: 17, fontWeight: FontWeight
                                              .w400))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const FaIcon(FontAwesomeIcons.squareShareNodes, color: Color(0xFF767676)),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text('Соц. сети:', style: TextStyle(color: Color(0xFF767676),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),),
                                          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFFF6F7FB))),
                                          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.facebook, color: Color(0xFFF6F7FB))),
                                          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.telegram, color:  Color(0xFFF6F7FB))),
                                          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.vk, color: Color(0xFFF6F7FB))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const FaIcon(FontAwesomeIcons.internetExplorer, color: Color(0xFF767676)),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text('Веб-сайт:', style: TextStyle(color: Color(0xFF767676),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),),
                                          TextButton(onPressed: _launchUrl, child: const Text("https://gohookah.ilavista.tech/", style:
                                          TextStyle(color: Color(0xFFF6F7FB), fontSize: 17, fontWeight: FontWeight
                                              .w400))),
                                        ],
                                      ),
                                  ],),
                            ),
                              Padding(padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                                  child: 
                              Container(
                                height: 2,
                                color: const Color(0xFF333333),
                              ),
                              ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(16, 25, 16, 20),
                              child:
                                  Text("Отзывы", style: TextStyle(
                                    color: Color(0xFFF6F7FB),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
                              child:
                              SizedBox(
                                height: 237,
                                child:
                                ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      height: 237,
                                      width: 254,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF333333),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    );
                                  }, separatorBuilder: (BuildContext context, int index) =>
                                const SizedBox(
                                  width: 16,
                                ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Card(
          elevation: 0,
          color: const Color(0xFF2B2B2B),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.455,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFF333333),
              border: Border.all(color: Colors.transparent, width: 0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.255,
                  width: MediaQuery.of(context).size.width * 0.9,
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
                    imageUrl: 'https://gohookah.ilavista.tech/storage/place_img_sm/${cardModel?.image}',
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('${cardModel?.title}',
                            style:
                                const TextStyle(color: Color(0xFFFFC107), fontSize: 17, fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        '${cardModel?.rate}',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: Text('${cardModel?.address}',
                          style: const TextStyle(color: Color(0xFFF6F7FB), fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 19, 15, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TxtButton(txt: "Открыто до 6:00"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFFFFC107),
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () => launch("tel://${cardModel?.phone}"),
                              icon: const Icon(Icons.phone_outlined, color: Color(0xFFFFC107), size: 30)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  final Uri _url = Uri.parse('https://gohookah.ilavista.tech');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}



