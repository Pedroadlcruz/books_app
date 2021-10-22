import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_home_project/core/theme/app_colors.dart';

import 'package:take_home_project/features/books/bloc/books_bloc.dart';
import 'package:take_home_project/features/books/models/book.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/text_styles.dart';

import 'book_list_widget.dart';

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
        if (snapshot.hasError) {
          return const _ShowErrorMsj();
        }
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.dW),
            child: BookListWidget(books: snapshot.data!, showLikeBtn: false),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(title: Text(' '));
  }
}

class _ShowErrorMsj extends StatelessWidget {
  const _ShowErrorMsj({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470.dH,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.exclamation, size: 60.dW),
          SizedBox(height: 32.dH),
          SizedBox(
            height: 70.dW,
            width: 210.dW,
            child: Text(
              'A loading error has occurred',
              textAlign: TextAlign.center,
              style: TextStyles.text
                  .copyWith(fontSize: 18.fS, color: AppColors.color979797),
            ),
          ),
        ],
      ),
    );
  }
}
