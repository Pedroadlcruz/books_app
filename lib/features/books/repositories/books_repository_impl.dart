import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:take_home_project/core/error/books_exceptions.dart';
import 'package:take_home_project/features/auth/bloc/auth_bloc.dart';
import 'package:take_home_project/features/books/models/book.dart';

import 'package:take_home_project/features/books/models/response_model.dart';
import 'package:take_home_project/features/books/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final String _baseFirebaseUrl = 'books-app-55b92-default-rtdb.firebaseio.com';
  final AuthBloc authBloc;

  BooksRepositoryImpl(this.authBloc);
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
    } on Exception {
      throw const QueryBooksFailure();
    }
  }

  @override
  Future<ResponseModel> loadfavoritesBooks() async {
    final userId = authBloc.currentUser.id;
    final url =
        'https://books-app-55b92-default-rtdb.firebaseio.com/$userId.json';
    try {
      final result = await http.get(Uri.parse(url));
      if (result.statusCode == 200 && result.body != "null") {
        final books = <Book>[];
        (jsonDecode(result.body) as Map<String, dynamic>).forEach((key, value) {
          final book = Book.fromFirebaseJson(value as Map<String, dynamic>);
          books.add(book);
        });
        return ResponseModel(success: true, books: books);
      } else {
        return ResponseModel(success: false, books: []);
      }
    } catch (e) {
      print('Load Favorites exception ---> $e');
      throw QueryBooksFailure(e.toString());
    }
  }

  @override
  Future<String> addBook(Book book) async {
    final userId = authBloc.currentUser.id;
    final url = Uri.https(_baseFirebaseUrl, '$userId.json');
    try {
      final result = await http.post(url,
          body: jsonEncode(book.toFirebaseJson()),
          headers: {"provider": "google", "uid": userId});
      if (result.statusCode == 200) {
        print(result.body);
        final decodeData = jsonDecode(result.body);
        return decodeData['name'] as String;
      } else {
        return '';
      }
    } on Exception catch (e) {
      throw const QueryBooksFailure();
    }
  }

  @override
  Future updateBook(Book book) async {
    // await http.delete(url)
    // TODO: implement updateBook
    throw UnimplementedError();
  }
}
