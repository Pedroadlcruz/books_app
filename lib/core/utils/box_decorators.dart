import 'package:flutter/material.dart';
import 'package:take_home_project/core/extensions/responsive.dart';

BoxDecoration get whiteBoxDecoration => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15.dW),
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: const Color(0xff8A959A).withOpacity(0.15),
          blurRadius: 60,
          offset: const Offset(0, 30),
          spreadRadius: 2,
        ),
      ],
    );
