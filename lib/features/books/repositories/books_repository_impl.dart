import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:take_home_project/core/error/books_exceptions.dart';

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
      print(e);
      throw const QueryBooksFailure();
    }
  }
}
