import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gizu_github_app/theme/theme.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context,
  title,
) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: AppTheme.fourteenBold.copyWith(
            color: AppTheme.white,
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppTheme.lightOrange,
      ),
    );
