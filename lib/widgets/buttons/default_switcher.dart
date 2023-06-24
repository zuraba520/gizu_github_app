import 'package:flutter/material.dart';
import 'package:gizu_github_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:gizu_github_app/providers/theme_provider.dart';

class DefaultSwitcher extends StatelessWidget {
  const DefaultSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (__, theme, _) {
      final isActive = theme.currentTheme == AppTheme.appThemeLight();
      return Switch(
        value: isActive,
        onChanged: (_) {
          Provider.of<ThemeProvider>(context, listen: false).switchTheme();
        },
        trackColor: MaterialStatePropertyAll<Color>(
          isActive ? AppTheme.white : AppTheme.veryLightOrange,
        ),
        thumbColor: const MaterialStatePropertyAll<Color>(AppTheme.orange),
      );
    });
  }
}
