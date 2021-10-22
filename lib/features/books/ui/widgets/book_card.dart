import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/app_images.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/box_decorators.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
import 'package:take_home_project/features/books/models/book.dart';

import 'like_btn.dart';
import 'main_category_label.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    this.onTap,
    this.onLike,
    this.decoration,
    required this.book,
    this.showLikeBtn = true,
  }) : super(key: key);

  final Book book;
  final void Function()? onTap;
  final void Function()? onLike;
  final Decoration? decoration;
  final bool showLikeBtn;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            // height: 195.dH,
            width: 340.dW,
            margin: EdgeInsets.only(bottom: 26.dW),
            padding: EdgeInsets.symmetric(vertical: 18.dH),
            decoration: decoration ?? whiteBoxDecoration,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.dW)),
                  child: SizedBox(
                    height: 181.dH,
                    width: 128.dW,
                    child: FadeInImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        book.info?.imageLinks?.smallThumbnail! ??
                            AppImages.bookAltUrl,
                      ),
                      placeholder: const AssetImage(AppImages.placeholder),
                    ),
                  ),
                ),
                SizedBox(width: 16.dW),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        constraints: BoxConstraints(maxWidth: 160.dW),
                        child: Text('by $_buildAuthorsString',
                            style: TextStyles.text)),
                    SizedBox(height: 6.dH),
                    Container(
                      constraints: BoxConstraints(maxWidth: 160.dW),
                      child: Text(
                        book.info?.title ?? ' ',
                        style: TextStyles.mainLabel.copyWith(fontSize: 17.fS),
                      ),
                    ),
                    SizedBox(height: 6.dH),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFAC33),
                        ),
                        SizedBox(width: 6.dW),
                        Text(
                          book.info?.averageRating.toString() ?? '-',
                          style: TextStyles.text,
                        ),
                      ],
                    ),
                    SizedBox(height: 17.dH),
                    if (book.info!.categories!.isNotEmpty)
                      MainCategoryLabel(
                          mainCategory: book.info!.categories![0]),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (showLikeBtn)
          Positioned(
            right: 0,
            bottom: 22.dH,
            child:
                LikeBtn(onLike: onLike, isFavorite: book.isFavorite ?? false),
          ),
      ],
    );
  }

  String get _buildAuthorsString {
    final String authors = book.info!.authors!.isNotEmpty
        ? book.info!.authors!.toString().replaceAll("[", "").replaceAll("]", "")
        : 'anonymous';
    return authors;
  }
}
