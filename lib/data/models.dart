class MangaList {
  int end;
  List<Manga> manga;
  int page;
  int start;
  int total;

  MangaList({this.end, this.manga, this.page, this.start, this.total});

  MangaList.New() {
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

class MangaDetail {
  List<String> aka;
  List<String> akaAlias;
  String alias;
  String artist;
  List<String> artistKw;
  String author;
  List<String> authorKw;
  bool autoManga;
  bool baka;
  List<String> categories;
  List<dynamic> chapters;
  int chaptersLen;
  num created;
  String description;
  int hits;
  String image;
  String imageURL;
  int language;
  num lastChapterDate;
  int released;
  String startsWith;
  int status;
  String title;
  List<String> titleKw;
  int type;
  bool updatedKeywords;
  String url;

  MangaDetail(
      {this.aka,
      this.akaAlias,
      this.alias,
      this.artist,
      this.artistKw,
      this.author,
      this.authorKw,
      this.autoManga,
      this.baka,
      this.categories,
      this.chapters,
      this.chaptersLen,
      this.created,
      this.description,
      this.hits,
      this.image,
      this.imageURL,
      this.language,
      this.lastChapterDate,
      this.released,
      this.startsWith,
      this.status,
      this.title,
      this.titleKw,
      this.type,
      this.updatedKeywords,
      this.url});

  MangaDetail.New() {
    chapters = [];
    image = "";
    title = "";
  }

  MangaDetail.fromJson(Map<String, dynamic> json) {
    aka = json['aka'].cast<String>();
    akaAlias = json['aka-alias'].cast<String>();
    alias = json['alias'];
    artist = json['artist'];
    artistKw = json['artist_kw'].cast<String>();
    author = json['author'];
    authorKw = json['author_kw'].cast<String>();
    autoManga = json['autoManga'];
    baka = json['baka'];
    categories = json['categories'].cast<String>();
    chapters = json['chapters'].cast<dynamic>();
    chaptersLen = json['chapters_len'];
    created = json['created'];
    description = json['description'];
    hits = json['hits'];
    image = json['image'];
    imageURL = json['imageURL'] == null ? "" : json['imageURL'];
    language = json['language'];
    lastChapterDate = json['last_chapter_date'];
    released = json['released'];
    startsWith = json['startsWith'];
    status = json['status'];
    title = json['title'];
    titleKw = json['title_kw'].cast<String>();
    type = json['type'];
    updatedKeywords = json['updatedKeywords'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aka'] = this.aka;
    data['aka-alias'] = this.akaAlias;
    data['alias'] = this.alias;
    data['artist'] = this.artist;
    data['artist_kw'] = this.artistKw;
    data['author'] = this.author;
    data['author_kw'] = this.authorKw;
    data['autoManga'] = this.autoManga;
    data['baka'] = this.baka;
    data['categories'] = this.categories;
    data['chapters_len'] = this.chaptersLen;
    data['created'] = this.created;
    data['description'] = this.description;
    data['hits'] = this.hits;
    data['image'] = this.image;
    data['imageURL'] = this.imageURL;
    data['language'] = this.language;
    data['last_chapter_date'] = this.lastChapterDate;
    data['released'] = this.released;
    data['startsWith'] = this.startsWith;
    data['status'] = this.status;
    data['title'] = this.title;
    data['title_kw'] = this.titleKw;
    data['type'] = this.type;
    data['updatedKeywords'] = this.updatedKeywords;
    data['url'] = this.url;
    return data;
  }
}

class Chapters {
  List<dynamic> images;

  Chapters({this.images});

  Chapters.New() {
    images = [];
  }

  Chapters.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<dynamic>();
  }
}
