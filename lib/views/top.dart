import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_manga_reader/data/models.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class TopManga extends StatefulWidget {
  TopManga({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _TopMangaState createState() => _TopMangaState();
}

class _TopMangaState extends State<TopManga> {
  var _counter = 0;
  MangaList mangaList = MangaList.XZ();
  var mangaURL = "https://www.mangaeden.com/api/list/0/?p=1&l=100";

  void _getList() async {
    setState(() {
      updateMangaList();
    });
  }

  void updateMangaList() async {
    final response = await http.Client().get(mangaURL);
    final parsed = json.decode(response.body);
    mangaList = MangaList.fromJson(parsed);
    //mangaList.clear();
    //mangaList.addAll(forecastsList);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: mangaList.manga.length,
          itemBuilder: (context, index) {
            return mangaList.manga[index].imageURL.isNotEmpty
                ? Column(children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: "https://cdn.mangaeden.com/mangasimg/" +
                          mangaList.manga[index].imageURL,
                      placeholder: new CircularProgressIndicator(),
                      errorWidget: new Icon(Icons.error),
                    ),
                    ListTile(title: Text(mangaList.manga[index].title))
                  ])
                : ListTile(title: Text(mangaList.manga[index].title));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getList,
        tooltip: 'Update',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
