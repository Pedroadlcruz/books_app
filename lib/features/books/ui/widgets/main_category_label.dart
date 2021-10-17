import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/core/theme/text_styles.dart';

class MainCategoryLabel extends StatelessWidget {
  const MainCategoryLabel({
    Key? key,
    required this.mainCategory,
  }) : super(key: key);

  final String mainCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.dW, vertical: 5.dH),
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: 130.dW),
      decoration: BoxDecoration(
        color: const Color(0xffA1DFFC),
        borderRadius: BorderRadius.all(Radius.circular(30.dW)),
      ),
      child: Text(
        mainCategory,
        style: TextStyles.blueText.copyWith(fontSize: 13.fS),
      ),
    );
  }
}
