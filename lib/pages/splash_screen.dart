import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gizu_github_app/pages/landing_page.dart';
import 'package:gizu_github_app/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';//

  @override
  State<SplashScreen> createState() => _SplashScreenState();//return
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _loadTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _loadTimer() {
    _timer = Timer(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushNamed(LandingPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightOrange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: SvgPicture.asset(
              'assets/svgs/github.svg',
              // ignore: deprecated_member_use
              color: AppTheme.white,
            ),
          ),
          Center(
            child: Text(
              'welcome',
              style: AppTheme.twentyBold.copyWith(
                color: AppTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
