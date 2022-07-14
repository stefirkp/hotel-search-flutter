import 'package:flutter/material.dart';
import '../widget/search_input.dart';
import '../widget/search_result.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accomodation")),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [SearchInput(), SearchResult()]),
      ),
    );
  }
}
