import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:vison/comparePage/compare_view.dart';
import 'package:vison/widgets/AnimatedSplashScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vison/comparePage/LanguageService.dart';
import 'package:path_provider/path_provider.dart';
import 'comparePage/ThemeService.dart';
import 'landingpage/landing_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(LanguageAdapter());
  await Hive.openBox<Language>('language');
  Get.put(LanguageService());
  Get.put(ThemeService());
  final ThemeService themeService = Get.find<ThemeService>();
  themeService.setisLightModefromPreferences();
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
    final themeService = Get.find<ThemeService>();
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
      theme: themeService.isLightMode ? themeService.lightTheme : themeService.darkTheme,
      home: const AnimatedSplashScreen(),
      builder: (context, child) {
        return GetBuilder<ThemeService>(
          init: ThemeService(),
          builder: (themeService) {
            return Theme(
              data: themeService.isLightMode ? themeService.lightTheme : themeService.darkTheme,
              child: child!,
            );
          },
        );
      },
      routes: {
        '/home': (context) => const LandingView(),
        '/videoCompare': (context) => const CompareView(),
      },
    );
  }
}
