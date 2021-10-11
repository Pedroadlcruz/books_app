import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:take_home_project/core/routes/app_router.dart';
import 'package:take_home_project/core/extensions/responsive.dart';

class TakeHomeProjectApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: MaterialApp(
            title: 'Take Home Projects',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme:
                  GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
            ),
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
