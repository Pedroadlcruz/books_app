import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/app_images.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/box_decorators.dart';
import 'package:take_home_project/core/theme/text_styles.dart';
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
                    isFavorite: book.isFavorite ?? false,
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
                        book.info?.imageLinks?.smallThumbnail! ??
                            AppImages.bookAltUrl,
                      ),
                      placeholder: const AssetImage(AppImages.placeholder),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 19.dH),
              if (book.info!.categories!.isNotEmpty)
                Wrap(
                  children: <Widget>[
                    ...book.info!.categories!
                        .map((categorie) =>
                            MainCategoryLabel(mainCategory: categorie))
                        .toList()
                  ],
                ),
              SizedBox(height: 28.dH),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text('by $_buildAuthorsString',
                          style: TextStyles.text
                              .copyWith(color: const Color(0xff979797)))),
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
              SizedBox(height: 20.dH),
              SizedBox(
                width: double.infinity,
                child: Text(
                  book.info?.title ?? ' ',
                  textAlign: TextAlign.start,
                  style: TextStyles.mainLabel.copyWith(fontSize: 24.fS),
                ),
              ),
              SizedBox(height: 10.dH),
              Text(
                book.info?.description ?? Strings.noDescriptionDetail,
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
    final String authors = book.info!.authors!.isNotEmpty
        ? book.info!.authors!.toString().replaceAll("[", "").replaceAll("]", "")
        : 'anonymous';
    return authors;
  }
}
