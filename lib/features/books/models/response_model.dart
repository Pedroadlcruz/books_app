import 'package:take_home_project/features/books/models/book.dart';

class ResponseModel {
  String? kind;
  int? totalItems;
  bool? success;
  List<Book>? books;
  ResponseModel({
    this.kind,
    this.totalItems,
    this.success,
    this.books,
  });
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    final Iterable bookList = json['items'] as Iterable;
    final List<Book> books =
        bookList.map((e) => Book.fromJson(e as Map<String, dynamic>)).toList();

    return ResponseModel(
        kind: json["kind"].toString(),
        totalItems: (json["totalItems"] ?? 0) as int,
        books: books);
  }

  ResponseModel copyWith({
    String? kind,
    int? totalItems,
    bool? success,
    List<Book>? books,
  }) {
    return ResponseModel(
      kind: kind ?? this.kind,
      totalItems: totalItems ?? this.totalItems,
      success: success ?? this.success,
      books: books ?? this.books,
    );
  }
}
