import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
import 'package:take_home_project/features/books/bloc/books_bloc.dart';
import 'package:take_home_project/features/books/models/book.dart';
import 'package:take_home_project/features/books/ui/screens/book_detail_screen.dart';
import 'package:take_home_project/features/books/ui/widgets/book_card.dart';
import 'package:take_home_project/features/books/ui/widgets/book_list_widget.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const String routeName = 'favorites_screen';

  @override
  Widget build(BuildContext context) {
    final booksBloc = context.watch<BooksBloc>();
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.dW),
        child: Column(
          children: [
            SizedBox(height: 62.dH, width: double.infinity),
            Text(
              Strings.favorites,
              style: TextStyles.mainLabel.copyWith(fontSize: 20.fS),
            ),
            SizedBox(height: 28.dH),
            booksBloc.loadingFavorites
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: 670.dH,
                    child: BookListWidget(books: booksBloc.favorites),
                  ),

            // ListView(
            //   padding: EdgeInsets.zero,
            //   children: [
            //     BookCard(
            //       book: Book.empty,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(15.dW),
            //         ),
            //       ),
            //       onLike: () => print(' Tap Like'),
            //       onTap: () => print(' Tap Card'),
            //     ),
            //     BookCard(
            //       book: Book.empty,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(15.dW),
            //         ),
            //       ),
            //       onTap: () => Navigator.pushNamed(
            //           context, BookDetailScreen.routeName),
            //     ),
            //     BookCard(
            //       book: Book.empty,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(15.dW),
            //         ),
            //       ),
            //       onLike: () => print(' Tap Like'),
            //       onTap: () => print(' Tap Card'),
            //     ),
            //     BookCard(
            //       book: Book.empty,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(15.dW),
            //         ),
            //       ),
            //       onTap: () => Navigator.pushNamed(
            //           context, BookDetailScreen.routeName),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabSelector(),
    );
  }
}
