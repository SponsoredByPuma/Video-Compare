import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/home/home_view.dart';
import 'package:myapp/widgets/AnimatedSplashScreen.dart';
import 'package:myapp/widgets/LandingPage.dart';
import 'package:get/get.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Compare',
      initialRoute: '/home',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(178, 206, 222, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(178, 206, 222, 1),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(255, 91, 31, 97), // 111, 104, 102, 1
          ),
        ),
        primaryColor: Colors.black,
        textTheme: GoogleFonts.robotoFlexTextTheme(),
      ),
      home: const AnimatedSplashScreen(),
      routes: {
        '/home': (context) => LandingPage(),
        '/videoCompare': (context) => const HomeView(),
      },
    );
  }
}
