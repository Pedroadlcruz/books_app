import 'package:flutter/material.dart';
import 'package:take_home_project/core/constants/app_images.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/features/auth/models/user.dart';

/// Use a circular placeholder gift while the given Image from Network is loading
/// Returns a defoult user profile image if given url is null
class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    Key? key,
    required this.appUser,
  }) : super(key: key);

  final User appUser;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(98.dW),
      child: SizedBox(
        height: 98.dW,
        width: 98.dW,
        child: FadeInImage(
          image: NetworkImage(
            appUser.photo ?? AppImages.emoji,
          ),
          placeholder: const AssetImage(AppImages.placeholder),
        ),
      ),
    );
  }
}
