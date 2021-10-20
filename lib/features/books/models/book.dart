import 'package:take_home_project/core/constants/app_images.dart';

class Book {
  /// The id of the book in Google books API
  final String id;

  /// The id from Firebase Real Time DB
  final String? uid;
  final String? etag;
  final bool? isFavorite;

  /// The informations about the book
  final BookInfo? info;

  const Book({
    required this.id,
    this.etag,
    this.uid,
    this.isFavorite = false,
    this.info,
  });

  @override
  String toString() => '$id:${info!.title}';

  factory Book.fromFirebaseJson(
    Map<String, dynamic> json,
  ) {
    return Book(
      id: json['id'] as String,
      uid: json['uid'] as String?,
      isFavorite: json["isFavorite"] as bool?,
      info: BookInfo.fromJson(
        json['volumeInfo'] as Map<String, dynamic>,
      ),
      // info: BookInfo(
      //   title: json["title"] as String,
      //   authors: [json["author"] as String],
      //   averageRating: ((json['averageRating'] ?? 0) as num).toDouble(),
      //   categories: [json["categories"] as String],
      //   description: json["description"] as String,
      //   imageLinks: ImageLinks(
      //     thumbnail: json["imageLink"] as String,
      //     smallThumbnail: json["imageLink"] as String,
      //   ),
      // ),
    );
  }

  Map<String, dynamic> toFirebaseJson() => {
        'id': id,
        'uid': uid ?? '',
        "isFavorite": isFavorite ?? false,
        "etag": etag,
        'volumeInfo': info?.toJson()
      };

  factory Book.fromJson(
    Map<String, dynamic> json,
  ) {
    return Book(
      id: json['id'] as String,
      etag: json['etag'] as String,
      // isFavorite: ['isFavorite'] as bool?,
      info: BookInfo.fromJson(
        json['volumeInfo'] as Map<String, dynamic>,
      ),
    );
  }

  Book copyWith({
    String? id,
    String? uid,
    String? etag,
    bool? isFavorite,
    BookInfo? info,
  }) {
    return Book(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      etag: etag ?? this.etag,
      isFavorite: isFavorite ?? this.isFavorite,
      info: info ?? this.info,
    );
  }

  static const empty = Book(id: '');

  bool get isEmpty => this == Book.empty;

  bool get isNotEmpty => this != Book.empty;
}

class BookInfo {
  /// The book title
  final String? title;

  /// A list with the name of all the authors of the book
  final List<String>? authors;

  /// The publisher name
  final String? publisher;

  /// The date the book was published
  final String? publishedDate;

  /// The date the book was published in raw string format
  final String? rawPublishedDate;

  /// The description of the book
  final String? description;

  /// The amount of pages the book has
  final int? pageCount;

  /// The categories the book is in
  final List<String>? categories;

  /// The average rating
  final double? averageRating;

  /// Some image links
  final ImageLinks? imageLinks;

  /// The original language of the book
  final String? language;

  const BookInfo({
    this.title,
    this.authors,
    this.publisher,
    this.averageRating,
    this.categories,
    this.description,
    this.imageLinks,
    this.language,
    this.pageCount,
    this.publishedDate,
    this.rawPublishedDate,
  });

  factory BookInfo.fromJson(Map<String, dynamic> json) {
    return BookInfo(
      title: json['title'] as String?,
      authors: ((json['authors'] as List<dynamic>?) ?? [])
          .map((e) => e.toString())
          .toList(),
      publisher: json['publisher'] as String?,
      averageRating: ((json['averageRating'] ?? 0) as num).toDouble(),
      categories: ((json['categories'] as List<dynamic>?) ?? [])
          .map((e) => e.toString())
          .toList(),
      description: json['description'] as String?,
      language: json['language'] as String?,
      pageCount: ((json['pageCount'] ?? 0) as num).toInt(),
      publishedDate: json['publishedDate'] as String?,
      rawPublishedDate: (json['publishedDate'] as String?) ?? '',
      imageLinks: json['imageLinks'] == null
          ? ImageLinks(
              thumbnail: AppImages.bookAltUrl,
              smallThumbnail: AppImages.bookAltUrl,
            )
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'rawPublishedDate': rawPublishedDate,
        'averageRating': averageRating,
        'categories': categories,
        'description': description,
        'language': language,
        'pageCount': pageCount,
        'imageLinks': imageLinks?.toJson(),
      };

  @override
  String toString() {
    return '''title: $title
    authors: $authors
    publisher: $publisher
    publishedDate: $publishedDate
    rawPublishedDate: $rawPublishedDate
    averageRating: $averageRating
    categories: $categories
    description: $description
    language: $language
    pageCount: $pageCount
    imageLinks: $imageLinks
    ''';
  }
}

class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });
  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
        smallThumbnail: json['smallThumbnail'] as String?,
        thumbnail: json['thumbnail'] as String?);
  }

  Map<String, dynamic> toJson() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
      };
}
