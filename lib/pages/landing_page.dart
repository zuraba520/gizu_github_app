import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gizu_github_app/theme/theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/landing';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.gray,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: SvgPicture.asset(
              'assets/svgs/github.svg',
              // ignore: deprecated_member_use
              color: AppTheme.black,
            ),
          ),
          Center(
            child: Text(
              'landing',
              style: AppTheme.twentyBold.copyWith(
                color: AppTheme.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
