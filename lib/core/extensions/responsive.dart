import 'package:sizer/sizer.dart';
export 'package:sizer/sizer.dart';

extension ResponsiveCalculation on num {
  static final double _designHeight = 844.0;
  static final double _designWidth = 390.0;

  ///
  ///Returns the percent [Height] based on the design height reference
  ///
  double get dH => (this / _designHeight) * 100.h;

  ///
  ///Returns the percent [Width] based on the design width reference
  ///
  double get dW => (this / _designWidth) * 100.w;

  ///
  ///Returns the percent [Font Size] based on the design width reference
  ///
  double get fS => dW;
}
