import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hotel_provider.dart';
import '../models/hotel.dart';

import './search_result_item.dart';

class SearchResult extends StatefulWidget {
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool _isLoading = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<HotelList>(context, listen: false).getAll();
  //   super.initState();
  // }

  Future? _hotelsFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<HotelList>(context, listen: false).getAll();
  }

  @override
  void initState() {
    _hotelsFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final hotelList = Provider.of<HotelList>(context).items;

    // print(hotelList);

    return FutureBuilder(
        future: _hotelsFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('No data found'),
              );
            } else {
              return Consumer<HotelList>(
                builder: (ctx, hotelData, child) => SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      width: double.infinity,
                      height: deviceSize.height - 100 - 122,
                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: ListView.builder(
                        itemBuilder: (ctx, i) => Card(
                          elevation: 0.2,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                          child: SearchResultItem(hotelData.items[i]),
                        ),
                        itemCount: hotelData.items.length,
                      )),
                ),
              );
            }
          }
        }
        // child:
        );
  }
}
