import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:take_home_project/core/error/books_exceptions.dart';
import 'package:take_home_project/features/books/models/book.dart';

import 'package:take_home_project/features/books/models/response_model.dart';
import 'package:take_home_project/features/books/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  @override
  Future<ResponseModel> queryBooks(
      {required String query, required int maxResults}) async {
    assert(query.isNotEmpty);
    final q =
        'https://www.googleapis.com/books/v1/volumes?q=${query.trim().replaceAll(' ', '+')}${'&maxResults=$maxResults'}';
    try {
      final result = await http.get(Uri.parse(q));
      if (result.statusCode == 200) {
        final respModel = ResponseModel.fromJson(
            jsonDecode(result.body) as Map<String, dynamic>);
        return respModel.copyWith(success: true);
      } else {
        return ResponseModel(success: false);
      }
    } on Exception catch (e) {
      throw QueryBooksFailure(e.toString());
    }
  }

  @override
  Future<ResponseModel> famousBooks() async {
    const q =
        'https://www.googleapis.com/books/v1/volumes?q=google${'&maxResults=10'}';
    try {
      final result = await http.get(Uri.parse(q));
      if (result.statusCode == 200) {
        final respModel = ResponseModel.fromJson(
            jsonDecode(result.body) as Map<String, dynamic>);
        return respModel.copyWith(success: true);
      } else {
        return ResponseModel(success: false);
      }
    } on Exception catch (e) {
      throw QueryBooksFailure(e.toString());
    }
  }

  @override
  Future<ResponseModel> loadfavoritesBooks() async {
    const url =
        'https://books-app-55b92-default-rtdb.firebaseio.com/books.json';
    final result = await http.get(Uri.parse(url));
    final Map<String, dynamic> booksMap =
        jsonDecode(result.body) as Map<String, dynamic>;
    print(booksMap);
    // final respModel = Book.fromFirebaseJson(
    //         jsonDecode(result.body) as Map<String, dynamic>);
    return ResponseModel(success: false);
  }
}
