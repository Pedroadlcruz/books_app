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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.dW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 77.dH, width: double.infinity),
              Text(Strings.booksScreenMsj,
                  style: TextStyles.mainLabel.copyWith(fontSize: 30.fS)),
              SizedBox(height: 35.dH),
              ChangeNotifierProvider(
                  create: (BuildContext context) =>
                      BooksBloc(booksRepository: BooksRepositoryImpl()),
                  child: const _SearchField()),
              SizedBox(height: 46.dH),
              Text(Strings.famousBooks,
                  style: TextStyles.mainLabel.copyWith(fontSize: 24.fS)),
              SizedBox(height: 26.dH),
              BookCard(
                onLike: () => print(' Tap Like'),
                onTap: () => print(' Tap Card'),
                title: 'The More of Less',
                author: 'Joshua Becker',
                mainCategory: 'Minimalist',
                averageRating: '4.5',
                isFavorite: false,
                imageLink:
                    "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=3&edge=curl&source=gbs_api",
              ),
              BookCard(
                onTap: () =>
                    Navigator.pushNamed(context, BookDetailScreen.routeName),
                title: 'The More of Less',
                author: 'Joshua Becker',
                mainCategory: 'Minimalist',
                averageRating: '4.5',
                isFavorite: true,
                imageLink:
                    "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=3&edge=curl&source=gbs_api",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabSelector(),
    );
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
          print('$selectedBook --> Book Screen');
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
