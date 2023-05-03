import 'package:flutter/material.dart';
import 'package:go_hookah_app/screens/hookah_card.dart';

import '../models/modal.dart';
import '../repository/CardRepository.dart';



class ScreenInfo extends StatefulWidget {

  const ScreenInfo({Key? key}) : super(key: key);

  @override
  State<ScreenInfo> createState() => _ScreenInfoState();
}

class _ScreenInfoState extends State<ScreenInfo> {
  Future<MainCardModel?>? dataLoadingState;
  @override
  Widget build(BuildContext context) {
    dataLoadingState ??= CardRepository.loadData(context);
    return FutureBuilder<MainCardModel?>(
      future: dataLoadingState,
      builder: (BuildContext context, AsyncSnapshot<MainCardModel?> data) {
        return data.connectionState != ConnectionState.done
            ? const Center(child: CircularProgressIndicator())
            : data.hasData
        ?data.data?.results?.isNotEmpty == true
        ? ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
              return
                HookahCard(
                  cardModel: data.data?.results?[index],
                key: ValueKey<int>(data.data?.results?[index].id ?? -1),
              );
            },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 20
          ),
          itemCount: data.data?.results?.length ?? 0,
        )
            : const Center(child: CircularProgressIndicator())
        : const Center(child: Text('Произошла ошибка'));
            },
    );
  }
}

