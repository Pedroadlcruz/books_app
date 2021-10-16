import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
import 'package:take_home_project/core/utils/box_decorators.dart';
import 'package:take_home_project/core/utils/text_styles.dart';
import 'package:take_home_project/features/books/ui/widgets/book_card.dart';
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
              const _SearchField(),
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
              const BookCard(
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
    return Container(
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
          SizedBox(
            height: 50.dH,
            width: 240.dW,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: Strings.searchHintTxt,
                helperStyle: TextStyles.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
