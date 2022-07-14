import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/hotel_provider.dart';

import './screen/search_result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HotelList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SearchResultScreen(),
        // routes: {
        //   '/search-result': (ctx) => SearchResultScreen(),
        // }
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cari hotel yuk!"),
//       ),
//       body: Center(
//         child: Text('Hello world'),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
