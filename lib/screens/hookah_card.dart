import 'package:flutter/material.dart';
import 'package:go_hookah_app/mini-moments/button.dart';
// import 'package:cached_network_image/cached_network_image.dart';

import '../models/modal.dart';

class HookahCard extends StatelessWidget {
  final CardModel? cardModel;

  const HookahCard({this.cardModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: GestureDetector(
        onTap: () {},
          child: Card(
        elevation: 0,
        color: const Color(0xFF2B2B2B),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.455,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFF333333),
            border: Border.all(color: Colors.transparent,
            width: 0),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.247,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Image.network(
                  fit: BoxFit.cover,
                  '${cardModel?.image}',
                  // placeholder: (context, url) => const CircularProgressIndicator(),
                  // errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
             Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child:
              Row(
                children: [
                  Expanded(
                    child: Text('${cardModel?.title}',
                        style: const TextStyle(color: Color(0xFFFFC107), fontSize: 17, fontWeight: FontWeight.w600)),
                  ),
                  Text('${cardModel?.rate}', style: const TextStyle(color: Color(0xFFC5C5C5)),),
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
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                   child: Text('${cardModel?.address}',
                    style: const TextStyle(color: Color(0xFFF6F7FB), fontSize: 15, fontWeight: FontWeight.w400)),
              ),
              ],
              ),

            Padding(padding: const EdgeInsets.fromLTRB(16, 36, 15, 0),
                child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                   const TxtButton(txt: "Открыто до 6:00"),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.location_on_outlined, color: Color(0xFFFFC107),
                        size: 30,)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.phone_outlined, color: Color(0xFFFFC107),
                          size: 30)),
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
}
