import 'package:flutter/material.dart';
import 'package:gizu_github_app/widgets/app_bars/default_app_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        hasFavoriteBtn: false,
        title: 'Favorite zg',

      ),
      body: ListView(
        padding: EdgeInsets.zero,
      ),
    );
  }
}



