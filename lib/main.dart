import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routes/route_generator.dart';
import 'routes/routes.dart';
import 'utils/themebloc/theme_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);




  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('it', 'IT'),
        Locale('pt', 'PT'),
        Locale('fr', 'FR'),
      ],
      path: 'assets/languages',
    ),
  );
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      title: 'MedAPP',
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        EasyLocalization.of(context)!.delegate,
      ],
      supportedLocales: EasyLocalization.of(context)!.supportedLocales,
      locale: EasyLocalization.of(context)!.locale,
      debugShowCheckedModeBanner: false,
      theme: state.themeData,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  // Ensure that this method signature matches the superclass method signature
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
