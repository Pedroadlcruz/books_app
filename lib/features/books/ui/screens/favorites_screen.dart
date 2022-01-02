import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/app_images.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
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
                : _FavoritesView(booksBloc: booksBloc),
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabSelector(),
    );
  }
}

class _FavoritesView extends StatelessWidget {
  const _FavoritesView({
    Key? key,
    required this.booksBloc,
  }) : super(key: key);

  final BooksBloc booksBloc;

  @override
  Widget build(BuildContext context) {
    if (booksBloc.favorites.isNotEmpty) {
      return SizedBox(
        height: 670.dH,
        child: BookListWidget(books: booksBloc.favorites),
      );
    } else {
      return SizedBox(
        height: 670.dH,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AppImages.blueHeart,
              height: 118.dW,
              width: 132.dW,
              color: AppColors.color979797,
            ),
            SizedBox(height: 32.dH),
            SizedBox(
              height: 70.dW,
              width: 210.dW,
              child: Text(
                Strings.noFavoriteBooksMsg,
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
}
