import 'package:flutter/material.dart';
import 'package:flutter_manga_reader/views/manga_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorDark: Colors.grey,
          accentColor: Colors.amber),
      home: MangaListView(title: 'Manga List'),
    );
  }
}
