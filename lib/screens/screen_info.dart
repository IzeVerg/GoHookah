import 'package:flutter/material.dart';

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
    return FutureBuilder(
      future: dataLoadingState,
      builder: (BuildContext context, AsyncSnapshot<MainCardModel?> data) {
        return data.connectionState != ConnectionState.done
            ? const Center(child: CircularProgressIndicator())
            : data.hasData
            ?ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return HookahCard(
                  MainCardModel : data.data?.data?[index],
                key: ValueKey<int>(data.data?.data?[index].id ?? -1),
              );
            },
          itemCount: data.data?.data?.length ?? 0,
        )
            : const Center(child: CircularProgressIndicator());
    },
    );
  }
}

