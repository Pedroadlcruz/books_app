import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
import 'package:take_home_project/core/theme/box_decorators.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
import 'package:take_home_project/features/books/bloc/books_bloc.dart';
import 'package:take_home_project/features/books/models/book.dart';
import 'package:take_home_project/features/books/repositories/books_repository_impl.dart';
import 'package:take_home_project/features/books/ui/screens/book_detail_screen.dart';
import 'package:take_home_project/features/books/ui/widgets/book_card.dart';
import 'package:take_home_project/features/books/ui/widgets/books_search_delegate.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);
  static const String routeName = 'books_screen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          BooksBloc(booksRepository: BooksRepositoryImpl()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.dW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 77.dH, width: double.infinity),
              Text(Strings.booksScreenMsj,
                  style: TextStyles.mainLabel.copyWith(fontSize: 30.fS)),
              SizedBox(height: 35.dH),
              const _SearchField(),
              SizedBox(height: 46.dH),
              Text(Strings.famousBooks,
                  style: TextStyles.mainLabel.copyWith(fontSize: 24.fS)),
              SizedBox(height: 26.dH),
              const _FamousBooks(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomTabSelector(),
      ),
    );
  }
}

class _FamousBooks extends StatelessWidget {
  const _FamousBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksBloc = context.watch<BooksBloc>();
    return Expanded(
        child: FutureBuilder(
      future: booksBloc.getFamousBooks(),
      builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final Book book = snapshot.data![index];
              return BookCard(
                book: book,
                onLike: () => print(' Tap Like'),
                onTap: () => Navigator.pushNamed(
                    context, BookDetailScreen.routeName,
                    arguments: book),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksBloc = context.watch<BooksBloc>();
    return InkWell(
      onTap: () async {
        final selectedBook = await showSearch(
            context: context,
            delegate: BooksSearchDelegate(booksBloc,
                searchFieldLabel: Strings.searchHintTxt));
        if (selectedBook!.isNotEmpty) {
          Navigator.pushNamed(context, BookDetailScreen.routeName,
              arguments: selectedBook);
        }
      },
      child: Container(
        height: 60.dH,
        width: 340.dW,
        decoration: whiteBoxDecoration.copyWith(
          borderRadius: BorderRadius.all(Radius.circular(50.dW)),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 28.dW),
            const Icon(CupertinoIcons.search),
            SizedBox(width: 18.dW),
            Text(Strings.searchHintTxt, style: TextStyles.text),
          ],
        ),
      ),
    );
  }
}
