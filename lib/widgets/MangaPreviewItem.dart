import 'package:flutter/material.dart';
import 'package:flutter_manga_reader/data/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

final IMAGE_PLACEHOLDER_URL =
    "http://actar.com/wp-content/uploads/2015/12/nocover.jpg";

final MANGA_IMG_PREFIX = "https://cdn.mangaeden.com/mangasimg/";

class MangaPreviewItem extends StatelessWidget {
  final Manga manga;

  MangaPreviewItem({this.manga});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
              imageUrl: MANGA_IMG_PREFIX + manga.imageURL,
              fit: BoxFit.cover,
              errorWidget: CachedNetworkImage(imageUrl: IMAGE_PLACEHOLDER_URL)),
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
    );
  }
}
