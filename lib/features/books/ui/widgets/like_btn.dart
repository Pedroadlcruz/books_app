import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/app_colors.dart';

class LikeBtn extends StatelessWidget {
  const LikeBtn({
    Key? key,
    this.onLike,
    required this.isFavorite,
    this.height,
    this.width,
    this.margin,
  }) : super(key: key);

  final void Function()? onLike;
  final bool isFavorite;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onLike,
      child: Container(
        margin: margin ?? EdgeInsets.only(bottom: 15.dH),
        height: height ?? 80.dH,
        width: width ?? 70.dW,
        alignment: Alignment.center,
        child: Icon(
          isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          size: 29.fS,
          color: isFavorite ? AppColors.primaryColor : null,
        ),
      ),
    );
  }
}
