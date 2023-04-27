import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_flutter/screens/splash/splash_screen.dart';

import 'config/routes.dart';
import 'theme/palette.dart';
import 'theme/styles.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYT',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
        textTheme: textTheme,
      ),
      onGenerateRoute: generateRoute,
      // home: const SplashScreen(),
    );
  }
}

class AppInit extends StatefulWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: SplashScreen(),
      ),
    );
  }
}
