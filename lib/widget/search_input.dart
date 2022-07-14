import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hotel_provider.dart';

class SearchInput extends StatefulWidget {
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _keywordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  bool _isEmptyError = false;
  bool _isLoading = false;

  Future<void> _searchList(String value) async {
    if (value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please type keyword search"),
          backgroundColor: Colors.red));
    } else {
      setState(() {
        _isLoading = false;
      });
      await Provider.of<HotelList>(context, listen: false).getAll(value);
      setState(() {
        _isLoading = true;
      });
    }
  }

  Future<void> _resetList() async {
    setState(() {
      _isLoading = false;
    });
    await Provider.of<HotelList>(context, listen: false).getAll();
    _keywordController.text = '';
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // goal: introduce text biasa vs text validator
    return Container(
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffF5F6FA),
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(10)),
        ),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Icon(Icons.search, color: Color(0xffC6CBDA))),
            Expanded(
              // cara 1 tanpa validator
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Where do you want to stay?"),
                controller: _keywordController,
                onSubmitted: _searchList,
              ),
            ),
            _keywordController.text.isEmpty
                ? SizedBox()
                : IconButton(onPressed: _resetList, icon: Icon(Icons.close))
          ],
        )
      ]),
    );
  }
}
