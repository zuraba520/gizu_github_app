import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gizu_github_app/pages/landing_page.dart';
import 'package:gizu_github_app/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500),() {
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
