import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_manga_reader/data/models.dart';
import 'package:flutter_manga_reader/widgets/MangaPreviewItem.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      body: GridView.builder(
        itemBuilder: (context, position) {
          return MangaPreviewItem(manga: mangaList.manga[position]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6666),
        itemCount: mangaList.manga.length,
      ),
    );
  }
}
