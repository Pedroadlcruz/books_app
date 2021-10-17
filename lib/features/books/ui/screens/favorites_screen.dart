import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/strings.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/utils/text_styles.dart';
import 'package:take_home_project/features/books/ui/screens/book_detail_screen.dart';
import 'package:take_home_project/features/books/ui/widgets/book_card.dart';
import 'package:take_home_project/features/home/ui/widgets/bottom_tab_selector.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const String routeName = 'favorites_screen';

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 670.dH,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  BookCard(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.dW),
                      ),
                    ),
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.dW),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(
                        context, BookDetailScreen.routeName),
                    title: 'The More of Less',
                    author: 'Joshua Becker',
                    mainCategory: 'Minimalist',
                    averageRating: '4.5',
                    isFavorite: true,
                    imageLink:
                        "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=3&edge=curl&source=gbs_api",
                  ),
                  BookCard(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.dW),
                      ),
                    ),
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.dW),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(
                        context, BookDetailScreen.routeName),
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
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabSelector(),
    );
  }
}
