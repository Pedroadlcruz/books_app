import 'package:flutter/material.dart';

/// Blue label custom Button
class AppBtn extends StatelessWidget {
  const AppBtn({
    Key? key,
    this.onPressed,
    required this.label,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(310.0, 53.0),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16.0),
      ),
      onPressed: onPressed,
    );
  }
}
