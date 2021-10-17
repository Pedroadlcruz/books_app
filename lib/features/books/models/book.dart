class Book {
  /// The id of the book
  final String id;
  final String? etag;
  final bool? isFavorite;

  /// The informations about the book
  final BookInfo info;

  const Book({
    required this.id,
    this.etag,
    this.isFavorite,
    required this.info,
  });

  @override
  String toString() => '$id:${info.title}';

  factory Book.fromJson(
    Map<String, dynamic> json,
  ) {
    return Book(
      id: json['id'] as String,
      etag: json['etag'] as String,
      info: BookInfo.fromJson(
        json['volumeInfo'] as Map<String, dynamic>,
      ),
    );
  }

  Book copyWith({
    String? id,
    String? etag,
    bool? isFavorite,
    BookInfo? info,
  }) {
    return Book(
      id: id ?? this.id,
      etag: etag ?? this.etag,
      isFavorite: isFavorite ?? this.isFavorite,
      info: info ?? this.info,
    );
  }
}

class BookInfo {
  /// The book title
  final String title;

  /// A list with the name of all the authors of the book
  final List<String> authors;

  /// The publisher name
  final String publisher;

  /// The date the book was published
  final String? publishedDate;

  /// The date the book was published in raw string format
  final String rawPublishedDate;

  /// The description of the book
  final String description;

  /// The amount of pages the book has
  final int pageCount;

  /// The categories the book is in
  final List<String> categories;

  /// The average rating
  final double? averageRating;

  /// Some image links
  final List<String> imageLinks;

  /// The original language of the book
  final String language;

  const BookInfo({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.averageRating,
    required this.categories,
    required this.description,
    required this.imageLinks,
    required this.language,
    required this.pageCount,
    required this.publishedDate,
    required this.rawPublishedDate,
  });

  factory BookInfo.fromJson(Map<String, dynamic> json) {
    return BookInfo(
      title: json['title'] as String,
      authors: ((json['authors'] as List<dynamic>?) ?? [])
          .map((e) => e.toString())
          .toList(),
      publisher: json['publisher'] as String,
      averageRating: ((json['averageRating'] ?? 0) as num).toDouble(),
      categories: ((json['categories'] as List<dynamic>?) ?? [])
          .map((e) => e.toString())
          .toList(),
      description: json['description'] as String,
      language: json['language'] as String,
      pageCount: ((json['pageCount'] ?? 0) as num).toInt(),
      publishedDate: json['publishedDate'] as String,
      rawPublishedDate: (json['publishedDate'] as String?) ?? '',
      imageLinks: ((json['imageLinks'] as List<dynamic>?) ?? [])
          .map((e) => e.toString())
          .toList(),
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
        'imageLinks': imageLinks,
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
