class MainModelShop {

  final List<ModelShop>? result;

  MainModelShop({this.result});
}

class ModelShop{
  ModelShop({
    this.idd,
    this.titlee,
    this.imagee,
    this.addresss,
    this.phonee,
    this.descriptionn,
    this.ratee,
    required this.latt,
    required this.lonn,
});
  final int? idd;
  final String? titlee;
  final String? imagee;
  final String? addresss;
  final String? phonee;
  final String? descriptionn;
  final double? ratee;
  final String latt;
  final String lonn;
}