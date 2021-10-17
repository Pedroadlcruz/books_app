import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/utils/box_decorators.dart';
import 'package:take_home_project/core/utils/text_styles.dart';
import 'package:take_home_project/features/books/ui/widgets/like_btn.dart';
import 'package:take_home_project/features/books/ui/widgets/main_category_label.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);
  static const String routeName = 'book_detail_screen';

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
                    isFavorite: true,
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
                  child: Image.network(
                    "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=3&edge=curl&source=gbs_api",
                    height: 255.dH,
                    width: 181.dW,
                  ),
                ),
              ),
              SizedBox(height: 19.dH),
              const MainCategoryLabel(mainCategory: 'Minimalista'),
              SizedBox(height: 28.dH),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text('by Joshua Becker',
                          style: TextStyles.text
                              .copyWith(color: const Color(0xff979797)))),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFAC33),
                  ),
                  SizedBox(width: 6.dW),
                  Text(
                    '4.5',
                    style: TextStyles.text,
                  ),
                ],
              ),
              SizedBox(height: 20.dH),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'The More of Less',
                  textAlign: TextAlign.start,
                  style: TextStyles.mainLabel.copyWith(fontSize: 24.fS),
                ),
              ),
              SizedBox(height: 10.dH),
              Text(
                'Please enter your email. We will send you 4-digit code to verify your account. Please enter your email. We will send you 4-digit code to verify your account.Please enter your email. We will send you 4-digit code to verify your account.',
                textAlign: TextAlign.start,
                style: TextStyles.text.copyWith(height: 1.6.dH),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomTabSelector(),
    );
  }
}
