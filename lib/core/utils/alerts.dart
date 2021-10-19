import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
}
