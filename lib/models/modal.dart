class MainCardModel {

final List<CardModel>? results;

MainCardModel({this.results});

}



class CardModel{
  const CardModel({
    this.id,
    this.title,
    this.image,
    this.address,
    this.phone,
    this.description,
    this.rate,
});
  final int? id;
  final String? title;
  final String? address;
  final String? phone;
  final String? description;
  final String? image;
  final double? rate;
}
