import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:take_home_project/core/routes/app_router.dart';
import 'package:take_home_project/core/extensions/responsive.dart';
import 'package:take_home_project/features/auth/bloc/auth_bloc.dart';
import 'package:take_home_project/features/auth/models/user.dart';
import 'package:take_home_project/features/auth/repositories/auth_repository_impl.dart';

class BooksApp extends StatelessWidget {
  // This widget is the root of your application.
  const BooksApp({
    Key? key,
    required AuthRepositoryImpl authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthRepositoryImpl _authRepository;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => AuthBloc(authRepository: _authRepository)),
      StreamProvider(
          create: (context) => context.read<AuthBloc>().authStatusChanges,
          initialData: User.empty),
    ], child: _AppView());
    // return _AppView();
  }
}

class _AppView extends StatelessWidget {
  const _AppView({
    Key? key,
  }) : super(key: key);

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
