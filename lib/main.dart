import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gizu_github_app/app.dart';
import 'package:gizu_github_app/theme/theme.dart';
import 'package:gizu_github_app/hive/setup_hive.dart';
// მთავარი გამშვები ფაილი
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppTheme.lightOrange,
    ),
  );
  //ლოკალური ბაზის კონფიგურაციის ფუნქცია
  await setupHive();
  runApp(const App());
}
