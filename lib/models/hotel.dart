import 'package:flutter/foundation.dart'; // need this to define required params, handle null safety

class Location {
  final String city;
  final String address;
  final String country;
  final String area;

  Location(
      {required this.city,
      required this.address,
      required this.country,
      required this.area});
}

class Price {
  final String currency;
  final num amount;

  Price({required this.currency, required this.amount});
}

class Hotel {
  final String id;
  final String name;
  final int starRating;
  final Price price;
  final String imageUrl;
  final Location location;

  Hotel(
      {required this.id,
      required this.name,
      required this.starRating,
      required this.price,
      required this.imageUrl,
      required this.location});
}
