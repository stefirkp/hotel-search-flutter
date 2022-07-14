import 'dart:convert'; //to use json encode
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; //to use ChangeNotifier class
import '../models/hotel.dart';

import '../dummy_data.dart';

class HotelList with ChangeNotifier {
  List<Hotel> _items = [];

  List<Hotel> get items {
    return [..._items];
  }

  Hotel findByCity(String cityKeyword) {
    return _items.firstWhere((element) => element.location.city == cityKeyword);
  }

  Future<void> getAll([String keyword = '']) async {
    final basedUrl = "https://sthotelflutter-default-rtdb.firebaseio.com";
    final endpoint = Uri.parse('$basedUrl/hotels.json');

    try {
      final response = await http.get(endpoint);
      final responseBody = json.decode(response.body);
      final List<Hotel> loadedSearchResult = [];

      if (responseBody == null) {
        _items = [];
        notifyListeners();
        return;
      }

      for (var i = 0; i < responseBody.length; i++) {
        final detailData = responseBody[i];

        if (keyword.isEmpty) {
          loadedSearchResult.add(Hotel(
              id: detailData['id'],
              name: detailData['name'],
              starRating: detailData['starRating'],
              price: Price(
                  amount: (detailData['price']['amount']),
                  currency: detailData['price']['currency']),
              imageUrl: detailData['imageUrl'],
              location: Location(
                  address: detailData['location']['address'],
                  city: detailData['location']['city'],
                  area: detailData['location']['area'],
                  country: detailData['location']['country'])));
        } else {
          final area = detailData['location']['area'].toLowerCase();
          final city = detailData['location']['city'].toLowerCase();

          if (area.contains(keyword.toLowerCase()) ||
              city.contains(keyword.toLowerCase())) {
            loadedSearchResult.add(Hotel(
                id: detailData['id'],
                name: detailData['name'],
                starRating: detailData['starRating'],
                price: Price(
                    amount: (detailData['price']['amount']),
                    currency: detailData['price']['currency']),
                imageUrl: detailData['imageUrl'],
                location: Location(
                    address: detailData['location']['address'],
                    city: detailData['location']['city'],
                    area: detailData['location']['area'],
                    country: detailData['location']['country'])));
          }
        }
      }

      _items = loadedSearchResult;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
