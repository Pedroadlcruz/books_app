import 'package:sizer/sizer.dart';
export 'package:sizer/sizer.dart';

// Using Dart Sizer Packages methodhs to calculate and adapt
//the app Ui based on the desing references
extension ResponsiveCalculation on num {
  static const double _designHeight = 896.0;
  static const double _designWidth = 414.0;

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
