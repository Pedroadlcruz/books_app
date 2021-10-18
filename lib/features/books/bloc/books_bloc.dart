import 'package:flutter/material.dart';
import 'package:take_home_project/core/error/books_exceptions.dart';
import 'package:take_home_project/features/books/models/book.dart';
import 'package:take_home_project/features/books/repositories/books_repository_impl.dart';

class BooksBloc extends ChangeNotifier {
  final BooksRepositoryImpl _booksRepository;

  BooksBloc({required BooksRepositoryImpl booksRepository})
      : _booksRepository = booksRepository,
        super() {
    loadFavoritesBooks();
  }

  final List<Book> favoritesBooks = [];

  Future<List<Book>> getBooksByName(String query) async {
    try {
      final result =
          await _booksRepository.queryBooks(query: query, maxResults: 10);
      if (result.success!) {
        return result.books!;
      } else {
        return [];
      }

      // print(result.result);
    } catch (e) {
      print("Book Bloc Exception: $e");
      throw const QueryBooksFailure();
    }
  }

  Future<List<Book>> getFamousBooks() async {
    try {
      final result = await _booksRepository.famousBooks();
      if (result.success!) {
        return result.books!;
      } else {
        return [];
      }

      // print(result.result);
    } catch (e) {
      print("Book Bloc Exception: $e");
      throw const QueryBooksFailure();
    }
  }

  Future loadFavoritesBooks() async {
    await _booksRepository.loadfavoritesBooks();
  }
}
