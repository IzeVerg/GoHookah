

class MainCardModel {

final List<CardModel>? data;

MainCardModel({this.data});

}



class CardModel{
  const CardModel({
    required this.id,
    required this.title,
    this.image,
    required this.address,
    this.phone,
    this.description,
    required this.rate,
});
  final int id;
  final String title;
  final String address;
  final String? phone;
  final String? description;
  final String? image;
  final double rate;
}
