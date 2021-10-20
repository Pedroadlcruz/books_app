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
    getFamousBooks();
  }

  List<Book> favorites = [];
  bool loadingFavorites = true;
  String errorLoadingFavorites = '';

  List<Book> famous = [];
  bool loadingFamous = true;
  String errorLoadingFamous = '';

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
    } on Exception {
      throw const QueryBooksFailure();
    }
  }

  Future getFamousBooks() async {
    loadingFamous = true;
    notifyListeners();
    try {
      final result = await _booksRepository.famousBooks();
      if (result.success!) {
        famous = result.books!;
        loadingFamous = false;
        notifyListeners();
        return result.books!;
      } else {
        errorLoadingFamous = 'Unespected load error';
        loadingFamous = false;
        notifyListeners();
      }
    } on QueryBooksFailure {
      throw const QueryBooksFailure();
    }
  }

  Future loadFavoritesBooks() async {
    loadingFavorites = true;
    notifyListeners();
    try {
      final result = await _booksRepository.loadfavoritesBooks();
      if (result.success!) {
        favorites = result.books!;
        loadingFavorites = false;
        notifyListeners();
      } else {
        errorLoadingFavorites = 'Unespected load error';
        loadingFavorites = false;
        notifyListeners();
      }
    } on QueryBooksFailure catch (e) {
      print(e);
      throw const QueryBooksFailure();
    }
  }

  Future addFavoriteBook(Book book) async {
    final result = await _booksRepository.addBook(book);
    if (result.isNotEmpty) {
      book.copyWith(uid: result);
      favorites.add(book);
    } else {}
    print('Todo bien');
  }
}
