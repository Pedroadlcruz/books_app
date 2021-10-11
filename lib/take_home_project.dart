import 'package:flutter/material.dart';
import 'package:take_home_project/core/routes/app_router.dart';
import 'package:take_home_project/core/extensions/responsive.dart';

class TakeHomeProjectApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          title: 'Take Home Projects',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
