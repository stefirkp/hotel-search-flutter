import 'package:flutter/material.dart';
import '../models/hotel.dart';

class SearchResultItem extends StatelessWidget {
  final Hotel _hotelDetail;

  SearchResultItem(this._hotelDetail);

  List<Widget> StarRating(int starRating) {
    List<Widget> _widgetArr = [];
    for (var i = 0; i < starRating; i++) {
      _widgetArr.add(Icon(
        Icons.star,
        color: Colors.orange.shade200,
      ));
    }

    return _widgetArr;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          _hotelDetail.imageUrl,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      title: Column(children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Text(_hotelDetail.name,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Row(
          children: [
            Row(
              children: StarRating(_hotelDetail.starRating),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    '${_hotelDetail.location.area}, ${_hotelDetail.location.city}',
                    overflow: TextOverflow.ellipsis,
                  )),
            )
          ],
        )
      ]),
      // subtitle: Container(
      //   width: double.infinity,
      //   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      //   child: Text(
      //     '${_hotelDetail.price.currency} ${_hotelDetail.price.amount.toString()}',
      //     style: TextStyle(
      //         color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
      //     textAlign: TextAlign.end,
      //   ),
      // ),
    );
  }
}
