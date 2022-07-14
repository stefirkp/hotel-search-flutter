import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hotel_provider.dart';

import './search_result_item.dart';

class SearchResult extends StatefulWidget {
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Provider.of<HotelList>(context, listen: false)
        .getAll()
        .then((_) => _isLoading = false);
    // _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final hotelList = Provider.of<HotelList>(context).items;

    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          height: deviceSize.height * 0.7,
          // decoration: BoxDecoration(border: Border.all(width: 1)),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (ctx, i) => Card(
                    elevation: 0.2,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: SearchResultItem(hotelList[i]),
                  ),
                  itemCount: hotelList.length,
                )),
    );
  }
}
