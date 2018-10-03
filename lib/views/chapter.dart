import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_manga_reader/data/models.dart';
import 'package:flutter_manga_reader/util/Constants.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

class ChapterView extends StatefulWidget {
  final chapterId;
  final title;

  ChapterView({this.chapterId, this.title});

  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  Chapters chapters = Chapters.New();

  void _initChapters() {
    debugPrint("start load");
    _getChapters().then((chapters) => setState(() {
          this.chapters = chapters;
          this.chapters.images.sort((first, second) => first[0] - second[0]);
        }));
  }

  Future<Chapters> _getChapters() async {
    final response = await http.Client()
        .get(Constants.MANGA_API + "chapter/" + widget.chapterId);
    final parsed = json.decode(response.body);
    return Chapters.fromJson(parsed);
  }

  @override
  void initState() {
    super.initState();
    debugPrint("init");
    WidgetsBinding.instance.addPostFrameCallback((_) => _initChapters());
  }

  @override
  Widget build(BuildContext context) {
    return chapters.images.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: ListView.builder(
                  itemCount: chapters.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: CachedNetworkImage(
                          placeholder:
                              Center(child: CircularProgressIndicator()),
                          imageUrl: Constants.MANGA_IMG_PREFIX +
                              chapters.images[index][1]),
                    );
                  }),
            ),
          );
  }
}
