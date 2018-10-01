class MangaList {
  int end;
  List<Manga> manga;
  int page;
  int start;
  int total;

  MangaList({this.end, this.manga, this.page, this.start, this.total});

  MangaList.XZ() {
    manga = [];
  }

  MangaList.fromJson(Map<String, dynamic> json) {
    end = json['end'];
    if (json['manga'] != null) {
      manga = new List<Manga>();
      json['manga'].forEach((v) {
        manga.add(new Manga.fromJson(v));
      });
    }
    page = json['page'];
    start = json['start'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end'] = this.end;
    if (this.manga != null) {
      data['manga'] = this.manga.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['start'] = this.start;
    data['total'] = this.total;
    return data;
  }
}

class Manga {
  String a;
  List<String> genres;
  int h;
  String id;
  String imageURL;
  num lastChapterDate;
  int s;
  String title;

  Manga(
      {this.a,
      this.genres,
      this.h,
      this.id,
      this.imageURL,
      this.lastChapterDate,
      this.s,
      this.title});

  Manga.fromJson(Map<String, dynamic> json) {
    a = json['a'];
    genres = json['c'].cast<String>();
    h = json['h'];
    id = json['i'];
    imageURL = json['im'] == null ? "" : json['im'];
    lastChapterDate = json['ld'];
    s = json['s'];
    title = json['t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['a'] = this.a;
    data['c'] = this.genres;
    data['h'] = this.h;
    data['i'] = this.id;
    data['im'] = this.imageURL;
    data['ld'] = this.lastChapterDate;
    data['s'] = this.s;
    data['t'] = this.title;
    return data;
  }
}
