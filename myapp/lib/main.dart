import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/home/home_view.dart';
import 'package:myapp/widgets/AnimatedSplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runApp(await buildApp());
}

Future<Widget> buildApp() async {
  return const ProviderScope(
    child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Compare',
    localizationsDelegates: [
      AppLocalizations.delegate, // Add this line
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('en'), // English
      Locale('de'), // Spanish
    ],
      theme: ThemeData(
          textTheme: GoogleFonts.robotoFlexTextTheme(), //Change the font for the whole App here
          scaffoldBackgroundColor: const Color.fromARGB(255, 11, 68, 6)),
      home: AnimatedSplashScreen(),
      routes: {
        '/home': (context) => const HomeView(),
      },
    );
  }
}
