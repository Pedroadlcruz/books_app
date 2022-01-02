import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';

///
/// An app white box [Custom Decoration]
///
BoxDecoration get whiteBoxDecoration => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15.dW),
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: const Color(0xff8A959A).withOpacity(0.20),
          blurRadius: 60,
          spreadRadius: 12,
        ),
      ],
    );
