import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:myapp/home/home_view.dart';
import 'package:myapp/widgets/AnimatedSplashScreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myapp/home/LanguageService.dart';
import 'package:path_provider/path_provider.dart';

import 'landingpage/landing_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(LanguageAdapter());
  await Hive.openBox<Language>('language');
  Get.put(LanguageService());
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
      initialBinding: BindingsBuilder(() {
        Get.put(LanguageService());
      }),
      initialRoute: '/',
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
        sliderTheme: const SliderThemeData(
          activeTrackColor: Color.fromARGB(248, 88, 10, 161),
          inactiveTrackColor: Color.fromARGB(204, 148, 10, 10),
          //overlayColor: Color.fromARGB(150, 153, 32, 190),
          trackHeight: 14,
          thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 12, pressedElevation: 10),
          thumbColor: Color.fromARGB(255, 255, 255, 255),
          trackShape: RectangularSliderTrackShape(),
          showValueIndicator: ShowValueIndicator.always,
          valueIndicatorColor: Color.fromARGB(255, 0, 0, 0),
          valueIndicatorTextStyle:
              TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      home: const AnimatedSplashScreen(),
      routes: {
        '/home': (context) => LandingView(),
        '/videoCompare': (context) => const HomeView(),
      },
    );
  }
}
