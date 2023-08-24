import 'package:flutter/material.dart';
import 'package:gizu_github_app/theme/theme.dart';
import 'package:gizu_github_app/widgets/app_bars/default_app_bar.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:gizu_github_app/models/repository.dart';
import 'package:gizu_github_app/widgets/lists/repository_list.dart';

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
        title: 'Favorites',//
      ),
      body: ValueListenableBuilder(//ცვლილებებისათვის რო ნახოს,
        valueListenable: Hive.box<Repository>('favorites').listenable(),
        builder: (context, repBox, _) {
          return repBox.values.isEmpty
              ? Center(
                  child: Text(
                    'No favorites',
                    style: AppTheme.twentyBold.copyWith(
                      color: AppTheme.darkOrange,
                    ),
                  ),
                )
              : RepositoryList(
                  list: repBox.values.toList(),
                );
        },
      ),
    );
  }
}

//ეს კოდი იმისთვისაა რო განსაზღვროს ფავორიტების გვერდი ანუ ჰივე - ის მიერ მოწოდებული მეხსიერების გამოყენებით.