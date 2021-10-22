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

  String errorAddingfavorites = '';

  late Book currentBook;

  Future<List<Book>> getBooksByName(String query) async {
    try {
      final result =
          await _booksRepository.queryBooks(query: query, maxResults: 10);
      if (result.success!) {
        return result.books!;
      } else {
        return [];
      }
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
        _loadingFamousError();
      }
    } on QueryBooksFailure {
      _loadingFamousError();
    }
  }

  void _loadingFamousError() {
    errorLoadingFamous = 'Unespected load error';
    loadingFamous = false;
    notifyListeners();
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
        _loadingFavoriteError();
      }
    } on QueryBooksFailure {
      _loadingFavoriteError();
    }
  }

  void _loadingFavoriteError() {
    errorLoadingFavorites = 'Unespected load error';
    loadingFavorites = false;
    notifyListeners();
  }

  Future<bool> onLikeTab() async {
    if (currentBook.uid == null || currentBook.uid!.isEmpty) {
      return _addToFavorites(currentBook);
    } else if (currentBook.uid!.isNotEmpty) {
      return _deleteFromFavorites(currentBook);
    }
    return true;
  }

  Future<bool> onDislikeTab(Book book) async {
    return _deleteFromFavorites(book);
  }

  Future<bool> _deleteFromFavorites(Book book) async {
    try {
      await _booksRepository.deleteBook(book);
      favorites.removeWhere((element) => element.uid == book.uid);
      notifyListeners();
      return true;
    } on Exception {
      errorAddingfavorites = 'Unespected error while deleting book';
      notifyListeners();
      return false;
    }
  }

  Future<bool> _addToFavorites(Book book) async {
    try {
      final result = await _booksRepository.addBook(book);
      if (result.isNotEmpty) {
        currentBook.uid = result;
        favorites.add(currentBook);
        notifyListeners();
      }
      return true;
    } on Exception {
      errorAddingfavorites = 'Unespected error while adding book';
      notifyListeners();
      return false;
    }
  }

  void toggleFavorite() {
    if (currentBook.isFavorite == null) {
      currentBook.isFavorite = true;
      notifyListeners();
    } else {
      currentBook.isFavorite = !currentBook.isFavorite!;
      notifyListeners();
    }
  }
}
