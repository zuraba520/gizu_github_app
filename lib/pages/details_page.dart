import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:gizu_github_app/models/repository.dart';
import 'package:gizu_github_app/theme/theme.dart';
import 'package:gizu_github_app/widgets/app_bars/default_app_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    required this.repository,
    Key? key,
  }) : super(key: key);
  final Repository repository;
  static const routeName = '/details';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Box<Repository> repositoryBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        hasFavoriteBtn: false,
        title: 'Details Page',
      ),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
            child: Container(
              color: AppTheme.lightOrange,
              height: 190,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.repository.ownerUrl,
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
          Padding(
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
                                Icons.star,
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
                        valueListenable:
                            Hive.box<Repository>('favorites').listenable(
                          keys: [widget.repository.id],
                        ),
                        builder: (context, repBox, _) {
                          final isFavorite =
                              repBox.containsKey(widget.repository.id);
                          return IconButton(
                            onPressed: () => isFavorite
                                ? repBox.deleteAt(widget.repository.id)
                                : repBox.put(
                                    widget.repository.id, widget.repository),
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
                  () {
                    Clipboard.setData(
                      ClipboardData(text: widget.repository.gitUrl),
                    );
                    // context.showSnackBar('link has copied');
                  },
                  Icons.commit,
                  'Git :   ',
                  widget.repository.gitUrl,
                ),
                const SizedBox(height: 10),
                iconButton(
                  () => launchUrlString(
                    'https://github.com/${widget.repository.owner}',
                  ),
                  Icons.person,
                  'Owner :   ',
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
      onTap: onTap,
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
