import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gizu_github_app/app.dart';
import 'package:gizu_github_app/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppTheme.lightOrange,
    ),
  );
  runApp(const App());
}
