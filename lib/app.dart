import 'package:flutter/material.dart';
import 'package:gizu_github_app/pages/landing_page.dart';
import 'package:gizu_github_app/pages/splash_screen.dart';
import 'package:gizu_github_app/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        SplashScreen.routeName:(_) => const SplashScreen(),
        LandingPage.routeName:(_) => const LandingPage(),
      },
      theme: AppTheme.appThemeLight(),
    );
  }
}
