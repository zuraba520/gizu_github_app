import 'package:flutter/material.dart';
import 'package:gizu_github_app/models/repository.dart';
import 'package:gizu_github_app/pages/details_page.dart';
import 'package:gizu_github_app/pages/favorites_page.dart';
import 'package:gizu_github_app/pages/landing_page.dart';
import 'package:gizu_github_app/pages/splash_screen.dart';
import 'package:gizu_github_app/providers/repository_provider.dart';
import 'package:gizu_github_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => RepositoryProvider()),
        ],
        builder: (BuildContext context, _) {
          return Consumer<ThemeProvider>(builder: (
            __,
            themeProvider,
            _,
          ) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: MaterialApp(
                title: 'GitHub Search',
                routes: {
                  SplashScreen.routeName: (_) => const SplashScreen(),
                  LandingPage.routeName: (_) => const LandingPage(),
                  FavoritesPage.routeName: (_) => const FavoritesPage(),
                  DetailsPage.routeName: (BuildContext context) => DetailsPage(
                        repository: ModalRoute.of(context)?.settings.arguments
                            as Repository,
                      ),
                },
                debugShowCheckedModeBanner: false,
                theme: themeProvider.currentTheme,
              ),
            );
          });
        },
      );
}
