import 'package:take_home_project/features/books/models/book.dart';
import 'package:take_home_project/features/books/models/response_model.dart';

abstract class BooksRepository {
  Future<ResponseModel> queryBooks(
      {required String query, required int maxResults});
  Future<ResponseModel> famousBooks();
}
