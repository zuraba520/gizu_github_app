import 'package:flutter/material.dart';
import 'package:gizu_github_app/models/repository.dart';
import 'package:gizu_github_app/theme/theme.dart';

class RepositoryList extends StatelessWidget {
  const RepositoryList({
    this.list,
    Key? key,
  }) : super(key: key);
  final List? list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (__, index) {
        return _buildRepositoryWidget(list?[index]);
      },
      padding: const EdgeInsets.symmetric(horizontal: 10),
      separatorBuilder: (__, _) => const Divider(
        color: AppTheme.lightOrange,
      ),
      itemCount: list?.length ?? 0,
    );
  }

  Row _buildRepositoryWidget(Repository repository) {
    return Row(
      children: [
        Image.network(
          repository.ownerUrl,
          width: 50,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                repository.name,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  repository.description,
                ),
              ),
              Text(
                '${repository.owner} - ${repository.star}',
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.favorite),
      ],
    );
  }
}
