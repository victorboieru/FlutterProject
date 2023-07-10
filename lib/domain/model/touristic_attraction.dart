class TouristicAttraction {
  String? id;
  String? name;
  String? imageUrl;
  String? category;
  double? distance;
  double? bikeDistance;
  double? carDistance;
  double? trainDistance;
  String? mapUrl;
  String? description;
  String? warning;
  String? openingHours;
  int? price;

  TouristicAttraction fromJson(var attraction) {
    id = attraction["_id"];
    name = attraction["name"];
    imageUrl = attraction["imageUrl"];
    category = attraction["category"];
    distance = attraction["distance"];
    bikeDistance = attraction["bikeDistance"];
    carDistance = attraction["carDistance"];
    trainDistance = attraction["trainDistance"];
    mapUrl = attraction["mapUrl"];
    description = attraction["description"];
    warning = attraction["warning"];
    openingHours = attraction["openingHours"];
    price = attraction["price"];
    return this;
  }
}