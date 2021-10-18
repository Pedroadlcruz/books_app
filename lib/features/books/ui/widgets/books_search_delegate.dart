import 'package:flutter/material.dart';

import 'package:take_home_project/features/books/bloc/books_bloc.dart';
import 'package:take_home_project/features/books/models/book.dart';

class BooksSearchDelegate extends SearchDelegate<Book> {
  @override
  final String searchFieldLabel;
  final BooksBloc booksBloc;
  BooksSearchDelegate(this.booksBloc, {required this.searchFieldLabel});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, Book.empty),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Text('Empty query');
    }

    return FutureBuilder(
      future: booksBloc.getBooksByName(query),
      builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
        if (snapshot.hasData) {
          return _showBooks(snapshot.data!);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(title: Text(' Suggestions'));
  }

  Widget _showBooks(List<Book> books) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        final Book book = books[index];
        return ListTile(
          title: Text(book.info!.title!),
          onTap: () => close(context, book),
        );
      },
    );
  }
}
