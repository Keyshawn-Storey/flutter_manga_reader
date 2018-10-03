import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_manga_reader/data/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_manga_reader/util/Constants.dart';
import 'package:flutter_manga_reader/views/chapter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MangaView extends StatefulWidget {
  final String mangaId;
  final String title;

  MangaView({this.mangaId, this.title});

  @override
  _MangaViewState createState() => _MangaViewState();
}

class _MangaViewState extends State<MangaView> {
  MangaDetail manga = MangaDetail.New();

  void _initManga() {
    debugPrint("start load");
    _getManga().then((mangaDetail) => setState(() {
          this.manga = mangaDetail;
          this.manga.chapters.sort((first, second) => first[0] - second[0]);
        }));
  }

  Future<MangaDetail> _getManga() async {
    final response = await http.Client()
        .get(Constants.MANGA_API + "manga/" + widget.mangaId);
    final parsed = json.decode(response.body);
    return MangaDetail.fromJson(parsed);
  }

  void openChapter(String chapterId, String title) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChapterView(
                  chapterId: chapterId,
                  title: title,
                )));
  }

  @override
  void initState() {
    super.initState();
    debugPrint("init");
    WidgetsBinding.instance.addPostFrameCallback((_) => _initManga());
  }

  @override
  Widget build(BuildContext context) {
    return manga.image.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                      height: 100.0,
                      child: CachedNetworkImage(
                          imageUrl: manga.image.isEmpty
                              ? Constants.IMAGE_PLACEHOLDER_URL
                              : Constants.MANGA_IMG_PREFIX + manga.image,
                          fit: BoxFit.scaleDown)),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: manga.chapters.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return GestureDetector(
                            onTapDown: (_) => openChapter(
                                manga.chapters[Index][3],
                                "Chapter " +
                                    manga.chapters[Index][0].toString() +
                                    " - " +
                                    manga.chapters[Index][2]),
                            child: ListTile(
                              title: Text("Chapter " +
                                  manga.chapters[Index][0].toString() +
                                  " - " +
                                  manga.chapters[Index][2]),
                            ));
                      }),
                )
              ],
            ),
          );
  }
}
