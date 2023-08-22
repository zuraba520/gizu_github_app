import 'package:flutter/material.dart';//ვიჯეტებისათვის
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:gizu_github_app/models/repository.dart';//რეპოზიტორი
import 'package:gizu_github_app/theme/theme.dart';//ჩასაკრასკისთვის
import 'package:gizu_github_app/widgets/app_bars/default_app_bar.dart';//დეფაულტი
import 'package:hive_flutter/hive_flutter.dart';//ჰაივი

import '../widgets/default_snack_bar.dart';

class DetailsPage extends StatefulWidget {//კლასის შექმნა დეტალების ანუ სთეითფულლით
  const DetailsPage({
    required this.repository,
    Key? key,
  }) : super(key: key);
  final Repository repository;
  static const routeName = '/details';

  @override
  State<DetailsPage> createState() => _DetailsPageState();//ანუ ეს ქრეათესთეითი აბრუნებს დეტალეის მაგალIთს,
// რომელის არის ამ ვიჯეტთან დაკავშირებული მდგომარეობის კლასი
}

class _DetailsPageState extends State<DetailsPage> {
  late Box<Repository> repositoryBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(//მთლიან სტრუქტურას განსაზღვრავს გვერდისას,
      appBar: const DefaultAppBar(//რომელიც მოიცავს  დეტალების გვერდს
        hasFavoriteBtn: false,//აქ უბრალოდ აიქონი არარის გულის ანუ ფავორიტების,
        title: 'Details Page',//უბრალოდ სახელი გვერდის
      ),
      body: ListView(
        children: [
          ClipRRect(//ეს ისევ მომრგვალება,თავისი რადიუსი რამდენი მოხრით,ფერით,სიმაღლით და ასე შემდეგ.
            // უფრო ზევით აწევას რო ვცდილობ,რატომღაც ყველაფერი ინგრევა და ბოლოს ასეც ლამაზად მომეჩვენა
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
            child: Container(
              color: AppTheme.lightOrange,
              height: 190,
              child: Column(
                children: [
                  ClipRRect(//მომრგვალება
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(//ფოტო
                      widget.repository.ownerUrl,//მფლობელი
                      width: 145,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.repository.owner,
                    style: AppTheme.twentyBold,
                  ),
                ],
              ),
            ),
          ),
          Padding(//დაშორება მიჭეჭყილი როარიყოს
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.repository.name,
                            style: AppTheme.twentyBold,
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,//ვარსკვლავის აიქონი და ეგეთები
                                color: AppTheme.lightOrange,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                widget.repository.star,
                                style: AppTheme.fourteen.copyWith(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ValueListenableBuilder(
                        valueListenable://
                            Hive.box<Repository>('favorites').listenable(),
                        builder: (context, repBox, _) {// ფავორიტებში რო შეგვიძლია დამატება აი ეგ ან პირიქით
                          final isFavorite =
                              repBox.containsKey(widget.repository.id);
                          return IconButton(//რო დააკლიკო
                            onPressed: () {
                              isFavorite
                                  ? repBox.delete(widget.repository.id)
                                  : repBox.put(
                                      widget.repository.id,
                                      widget.repository,
                                    );
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppTheme.darkOrange,
                            ),
                          );
                        }),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.repository.description,
                  style: AppTheme.fourteen,
                ),
                const SizedBox(height: 30),
                const Divider(
                  color: AppTheme.lightOrange,
                ),
                iconButton(
                  () {//აქ ორი ბმულიL: ოვნერი და გითის იუერელი
                    Clipboard.setData(
                      ClipboardData(text: widget.repository.gitUrl),
                    );
                    showSnackBar(context, 'link has copied');
                  },
                  Icons.commit,
                  'Git :   ',//აიქონი გითის
                  widget.repository.gitUrl,
                ),
                const SizedBox(height: 10),
                iconButton(
                  () => launchUrlString(
                    'https://github.com/${widget.repository.owner}',
                  ),
                  Icons.person,
                  'Owner :   ',//ადამიანის აიქონი
                  widget.repository.ownerUrl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector iconButton(onTap, icon, text, subtext) {
    return GestureDetector(
      onTap: onTap,//რო ამუშავდეს ღილაკი აი მაგისთვისაა ეგ
      child: Row(
        children: [
          Icon(
            icon,
            color: AppTheme.lightOrange,
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: text,
                style: AppTheme.fourteenBold.copyWith(
                  color: AppTheme.lightOrange,
                ),
                children: [
                  TextSpan(
                    text: subtext,
                    style: AppTheme.fourteenBold.copyWith(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
