import 'package:flutter/material.dart';
import 'package:flutter_manga_reader/data/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_manga_reader/util/Constants.dart';
import 'package:flutter_manga_reader/views/manga.dart';

class MangaPreviewItem extends StatelessWidget {
  final Manga manga;

  MangaPreviewItem({this.manga});

  void openManga(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MangaView(mangaId: manga.id, title: manga.title,)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => openManga(context),
      child: Card(
        color: Theme.of(context).cardColor,
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
                imageUrl: Constants.MANGA_IMG_PREFIX + manga.imageURL,
                fit: BoxFit.cover,
                errorWidget: CachedNetworkImage(
                    imageUrl: Constants.IMAGE_PLACEHOLDER_URL)),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withAlpha(150),
                  child: Text(
                    manga.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
