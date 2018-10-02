import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_manga_reader/data/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

class MangaListView extends StatefulWidget {
  MangaListView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MangaListViewState createState() => _MangaListViewState();
}

class _MangaListViewState extends State<MangaListView> {
  MangaList mangaList = MangaList.XZ();
  var mangaURL = "https://www.mangaeden.com/api/list/0/?p=1&l=100";

  void _getList() {
    getMangaList().then((mangaList) => setState(() {
          this.mangaList = mangaList;
        }));
  }

  Future<MangaList> getMangaList() async {
    final response = await http.Client().get(mangaURL);
    final parsed = json.decode(response.body);
    return MangaList.fromJson(parsed);
  }

  @override
  void initState() {
    super.initState();
    debugPrint("init");
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Text(mangaList.manga[position].title),
            );
          },
          itemCount: mangaList.manga.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getList,
        tooltip: 'Update',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
