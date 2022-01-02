import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/core/theme/app_colors.dart';
import 'package:take_home_project/core/extensions/responsive.dart';

/// Custom App Alerts
class Alerts {
  static void buildScaffoldMessenger({
    required BuildContext context,
    required String? text,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: SizedBox(
            height: 30,
            child: Text(text!),
          ),
          duration: duration ?? const Duration(seconds: 3),
        ),
      );
  }

  ///Build a [Custom Dialog] base on the current Platform [IOS] and [Android]
  static Future<Future> confirmDialog(
      {required BuildContext context,
      required String title,
      required void Function()? onYes}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Text(title),
            actions: <Widget>[
              TextButton(
                child: const Text('Yes'),
                onPressed: onYes,
              ),
              TextButton(
                child: const Text('No'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              TextButton(
                child: const Text('Yes'),
                onPressed: onYes,
              ),
              TextButton(
                child: const Text('No'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }
      },
    );
  }

  ///Build a [Custom Alert Dialog] base on the current Platform [IOS] and [Android]
  static Future<Future> alertDialog(
      {required BuildContext context,
      required String content,
      bool? isSucccess = true,
      required void Function()? onOk}) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: isSucccess!
                ? Icon(
                    Icons.check_circle_outline,
                    color: AppColors.primaryColor,
                    size: 60.dW,
                  )
                : Icon(
                    Icons.cancel_outlined,
                    color: AppColors.primaryColor,
                    size: 60.dW,
                  ),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: onOk,
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: isSucccess!
                ? Icon(
                    Icons.check_circle_outline,
                    color: AppColors.primaryColor,
                    size: 60.dW,
                  )
                : Icon(
                    Icons.cancel_outlined,
                    color: AppColors.primaryColor,
                    size: 60.dW,
                  ),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: onOk,
              ),
            ],
          );
        }
      },
    );
  }
}
