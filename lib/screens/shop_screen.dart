

import 'package:flutter/material.dart';
import 'package:go_hookah_app/models/model_shop.dart';
import 'package:go_hookah_app/repository/shop_repository.dart';
import 'package:go_hookah_app/screens/shop_card.dart';

class ShopInfo extends StatefulWidget {

  const ShopInfo({Key? key}) : super(key: key);

  @override
  State<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  Future<MainModelShop?>? dataLoadingState;
  @override
  Widget build(BuildContext context) {
    dataLoadingState ??= ShopRepository.loadData(context);
    return FutureBuilder<MainModelShop?>(
      future: dataLoadingState,
      builder: (BuildContext context, AsyncSnapshot<MainModelShop?> data) {
        return data.connectionState != ConnectionState.done
            ? const Center(child: CircularProgressIndicator())
            : data.hasData
            ?data.data?.result?.isNotEmpty == true
            ? ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return
              ShopCard(
                modelShop: data.data?.result?[index],
                key: ValueKey<int>(data.data?.result?[index].idd ?? -1),
              );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 20
          ),
          itemCount: data.data?.result?.length ?? 0,
        )
            : const Center(child: CircularProgressIndicator())
            : const Center(child: Text('Произошла ошибка'));
      },
    );
  }
}
