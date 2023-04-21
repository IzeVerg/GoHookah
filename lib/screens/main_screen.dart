import 'package:flutter/material.dart';
import 'package:go_hookah_app/mini-moments/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_hookah_app/repository/CardRepository.dart';
import '../models/modal.dart';
import '../notification/notif_about_location.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Color? textColor1 = Colors.black;

  Color? textColor2 = Colors.white;


  final TextEditingController _searchController = TextEditingController();

  int? groupValue = 0;

  double maxHeaderHeight = 110;

  late ScrollController _scrollController;

  final ValueNotifier<double> opacity = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
  }

  scrollListener() {
    if (maxHeaderHeight > _scrollController.offset && _scrollController.offset > 1) {
      opacity.value = 1 - _scrollController.offset / maxHeaderHeight;
    } else if (_scrollController.offset > maxHeaderHeight && opacity.value != 1) {
      opacity.value = 0;
    } else if (_scrollController.offset < 0 && opacity.value != 0) {
      opacity.value = 1;
    }
  }

  Future<MainCardModel?>? dataLoadingState;

  @override
  Widget build(BuildContext context) {
    dataLoadingState ??= CardRepository.loadData(context);
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    return Scaffold(
      backgroundColor: const Color(0xff2B2B2B),
      body:
      CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor: const Color(0xff2B2B2B),
            title: ValueListenableBuilder<double>(
                valueListenable: opacity,
                builder: (context, value, child) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 1),
                    opacity: 1.0 - value,
                    child: const Text("Каталог", style: TextStyle(color: Colors.white, fontSize: 17)),
                  );
                }),
            pinned: true,
            expandedHeight: maxHeaderHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 16,
                          ),
                          Text("Каталог", style: TextStyle(color: Colors.white, fontSize: 34, fontWeight:
                          FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:
                  Column(
                    children: [
                      const SizedBox(
                        height: 9,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 15),
                        child: SizedBox(
                          height: 40,
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
                      CupertinoSlidingSegmentedControl<int>(
                        backgroundColor: const Color(0xFF333333),
                        groupValue: groupValue,
                        thumbColor: CupertinoColors.extraLightBackgroundGray,
                        children: {
                          0: SizedBox(
                            width: 250,
                            child: Text(
                              "Кальянные",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: textColor1,
                              ),
                            ),
                          ),
                          1: SizedBox(
                            width: 250,
                            child: Text(
                              "Магазины",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: textColor2,
                              ),
                            ),
                          ),
                        },
                        onValueChanged: (value) {
                          setState(() {
                            groupValue = value;
                            textColor1 = groupValue == 0 ? Colors.black : Colors.white;
                            textColor2 = groupValue == 1 ? Colors.black : Colors.white;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomButton(
                            text: "Карта",
                            icon: CupertinoIcons.compass,
                          ),
                          CustomButton(
                            text: "Фильтры",
                            icon: Icons.filter_list,
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                color: Colors.green,
                                child: Text('$index'),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

