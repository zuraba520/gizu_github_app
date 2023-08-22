import 'package:flutter/material.dart';//ვიჯეტებისათვის
import 'package:gizu_github_app/theme/theme.dart';//ჩასაკრასკისთვის
import 'package:gizu_github_app/widgets/app_bars/default_app_bar.dart';
import 'package:hive_flutter/adapters.dart';//ადაპტერი

import 'package:gizu_github_app/models/repository.dart';
import 'package:gizu_github_app/widgets/lists/repository_list.dart';

class FavoritesPage extends StatelessWidget {//როგორც ყოველთვის კლასი შეიქმნა სახელი რაც შეიძლება რეალური,
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(//გვერდის მთლიან სტრუქტურას განსაზღვრავს,როგორც სხვაგან სხვისას განსაზღვრავდა,იგივე ასპექტში
      appBar: const DefaultAppBar(
        hasFavoriteBtn: false,//აიქონის ღილაკი რო აღარ იყოს,აღარ ჩანდეს,უშნოვდება მერე,და ლოგიკურად თუ თრუ იქნებოდა გამოჩნდებოდა
        title: 'Favorites',//ნუ ეს სახელი ცენტრში რო მოსჩანს
      ),
      body: ValueListenableBuilder(//ცვლილებებისათვის რო ნახოს,
        valueListenable: Hive.box<Repository>('favorites').listenable(),
        builder: (context, repBox, _) {//ანუ აი რეპბოქსში ცარიელი არის მაშIნ აჩვენებს არარჩეული გაქო
          return repBox.values.isEmpty//აქ კიდევ თუ არ გყავს,ან არ გეყოლება ფავორიტი რეპოზი.. მაშინ დაგიწერს ნო ფავორიტეს ცენტრში
              ? Center(
                  child: Text(
                    'No favorites',
                    style: AppTheme.twentyBold.copyWith(
                      color: AppTheme.darkOrange,
                    ),
                  ),
                )
              : RepositoryList(//თუ არჩეული არის კიდევ მაშინ გამოჩნდება
                  list: repBox.values.toList(),
                );
        },
      ),
    );
  }
}

//ეს კოდი იმისთვისაა რო განსაზღვროს ფავორიტების გვერდი ანუ ჰივე - ის მიერ მოწოდებული მეხსიერების გამოყენებით.