import 'package:flutter/material.dart';

void buildScaffoldMessenger({
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
