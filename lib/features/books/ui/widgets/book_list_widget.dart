import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/features/books/bloc/books_bloc.dart';
import 'package:take_home_project/features/books/models/book.dart';
import 'package:take_home_project/features/books/ui/screens/book_detail_screen.dart';

import 'book_card.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({
    Key? key,
    required this.books,
  }) : super(key: key);
  final List<Book> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        final Book book = books[index];
        return BookCard(
          book: book,
          onLike: () {
            print(' Tap Like');
            context.read<BooksBloc>().addFavoriteBook(book);
          },
          onTap: () => Navigator.pushNamed(context, BookDetailScreen.routeName,
              arguments: book),
        );
      },
    );
  }
}
