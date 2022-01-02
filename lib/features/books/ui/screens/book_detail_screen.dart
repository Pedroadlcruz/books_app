import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home_project/core/constants/app_images.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/box_decorators.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
import 'package:take_home_project/core/utils/alerts.dart';
import 'package:take_home_project/features/books/bloc/books_bloc.dart';
import 'package:take_home_project/features/books/models/book.dart';
import 'package:take_home_project/features/books/ui/widgets/like_btn.dart';
import 'package:take_home_project/features/books/ui/widgets/main_category_label.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key, required this.book}) : super(key: key);
  static const String routeName = 'book_detail_screen';
  final Book book;
  @override
  Widget build(BuildContext context) {
    final currentBook = context.watch<BooksBloc>().currentBook;
    return _Body(currentBook: currentBook);
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.currentBook,
  }) : super(key: key);

  final Book currentBook;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.dW),
          child: Column(
            children: [
              SizedBox(height: 62.dH, width: double.infinity),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      width: 40.dW,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Text(
                    Strings.bookDetail,
                    style: TextStyles.mainLabel.copyWith(fontSize: 20.fS),
                  ),
                  LikeBtn(
                    height: 50.dH,
                    width: 40.dW,
                    margin: EdgeInsets.zero,
                    isFavorite: currentBook.isFavorite ?? false,
                    onLike: () async {
                      context.read<BooksBloc>().toggleFavorite();
                      if (currentBook.isFavorite == null ||
                          currentBook.isFavorite == false) {
                        Alerts.confirmDialog(
                          context: context,
                          title: Strings.dislikeConfirmationMsg,
                          onYes: () async {
                            final success =
                                await context.read<BooksBloc>().onLikeTab();
                            if (!success) {
                              Navigator.pop(context);
                              Alerts.buildScaffoldMessenger(
                                context: context,
                                text: context
                                    .watch<BooksBloc>()
                                    .errorAddingfavorites,
                              );
                            } else {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          },
                        );
                      } else {
                        final success =
                            await context.read<BooksBloc>().onLikeTab();
                        if (!success) {
                          Alerts.buildScaffoldMessenger(
                            context: context,
                            text:
                                context.watch<BooksBloc>().errorAddingfavorites,
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 28.dH),
              Container(
                height: 255.dH,
                width: 181.dW,
                decoration: whiteBoxDecoration,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.dW)),
                  child: SizedBox(
                    height: 255.dH,
                    width: 181.dW,
                    child: FadeInImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        currentBook.info?.imageLinks?.smallThumbnail! ??
                            AppImages.bookAltUrl,
                      ),
                      placeholder: const AssetImage(AppImages.placeholder),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 19.dH),
              if (currentBook.info!.categories!.isNotEmpty)
                Wrap(
                  children: <Widget>[
                    ...currentBook.info!.categories!
                        .map((categorie) =>
                            MainCategoryLabel(mainCategory: categorie))
                        .toList()
                  ],
                ),
              SizedBox(height: 28.dH),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text('by  $_buildAuthorsString',
                          style: TextStyles.text
                              .copyWith(color: const Color(0xff979797)))),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFAC33),
                  ),
                  SizedBox(width: 6.dW),
                  Text(
                    currentBook.info?.averageRating.toString() ?? '-',
                    style: TextStyles.text,
                  ),
                ],
              ),
              SizedBox(height: 20.dH),
              SizedBox(
                width: double.infinity,
                child: Text(
                  currentBook.info?.title ?? ' ',
                  textAlign: TextAlign.start,
                  style: TextStyles.mainLabel.copyWith(fontSize: 24.fS),
                ),
              ),
              SizedBox(height: 10.dH),
              Text(
                currentBook.info?.description ?? Strings.noDescriptionDetail,
                textAlign: TextAlign.start,
                style: TextStyles.text.copyWith(height: 1.6.dH),
              ),
              SizedBox(height: 50.dH),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabSelector(),
    );
  }

  String get _buildAuthorsString {
    final String authors = currentBook.info!.authors!.isNotEmpty
        ? currentBook.info!.authors!
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", "")
        : 'anonymous';
    return authors;
  }
}
