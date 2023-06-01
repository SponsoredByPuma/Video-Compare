import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/home/home_view.dart';
import 'package:myapp/widgets/AnimatedSplashScreen.dart';

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
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 11, 68, 6)),
      home: const AnimatedSplashScreen(),
      routes: {
        '/home': (context) => const HomeView(),
      },
    );
  }
}
