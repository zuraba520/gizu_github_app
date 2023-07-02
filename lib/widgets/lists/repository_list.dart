import 'package:flutter/material.dart';
import 'package:gizu_github_app/models/repository.dart';
import 'package:gizu_github_app/pages/details_page.dart';
import 'package:gizu_github_app/theme/theme.dart';

class RepositoryList extends StatelessWidget {
  const RepositoryList({
    required this.list,
    Key? key,
  }) : super(key: key);
  final List<Repository> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (__, index) {
        return _buildRepositoryWidget(
          context,
          list[index],
        );
      },
      padding: const EdgeInsets.symmetric(horizontal: 10),
      separatorBuilder: (__, _) => const Divider(
        color: AppTheme.lightOrange,
      ),
      itemCount: list.length,
    );
  }

  GestureDetector _buildRepositoryWidget(
    BuildContext context,
    Repository repository,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailsPage.routeName,
          arguments: repository,
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.network(
              repository.ownerUrl,
              width: 70,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repository.name,
                  ),
                  Text(
                    repository.description,
                  ),
                  Text(
                    '${repository.owner} - ${repository.star}',
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
