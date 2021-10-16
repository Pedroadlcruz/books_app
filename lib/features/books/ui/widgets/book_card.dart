import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/utils/box_decorators.dart';
import 'package:take_home_project/core/utils/text_styles.dart';

import 'like_btn.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.title,
    required this.author,
    required this.mainCategory,
    required this.imageLink,
    required this.averageRating,
    this.onTap,
    this.onLike,
    this.isFavorite = false,
  }) : super(key: key);
  final String title;
  final String author;
  final String mainCategory;
  final String imageLink;
  final String averageRating;
  final bool isFavorite;
  final void Function()? onTap;
  final void Function()? onLike;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 195.dH,
            width: 340.dW,
            margin: EdgeInsets.only(bottom: 26.dW),
            decoration: whiteBoxDecoration,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.dW)),
                  child: Image.network(
                    imageLink,
                    height: 181.dH,
                    width: 128.dW,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.dW),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('by $author', style: TextStyles.text),
                    SizedBox(height: 6.dH),
                    Text(title,
                        style: TextStyles.mainLabel.copyWith(fontSize: 17.fS)),
                    SizedBox(height: 6.dH),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFAC33),
                        ),
                        SizedBox(width: 6.dW),
                        Text(
                          averageRating,
                          style: TextStyles.text,
                        ),
                      ],
                    ),
                    SizedBox(height: 17.dH),
                    Container(
                      height: 26.dH,
                      padding: EdgeInsets.symmetric(horizontal: 13.dW),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffA1DFFC),
                        borderRadius: BorderRadius.all(Radius.circular(30.dW)),
                      ),
                      child: Text(
                        mainCategory,
                        style: TextStyles.blueText.copyWith(fontSize: 13.fS),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 22.dH,
          child: LikeBtn(onLike: onLike, isFavorite: isFavorite),
        ),
      ],
    );
  }
}
