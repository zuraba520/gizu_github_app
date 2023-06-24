import 'package:flutter/material.dart';
import '../../models/repository.dart';
import '../../theme/theme.dart';

class RepositoryList extends StatelessWidget {
  const RepositoryList({
    this.list,
    Key? key,
  }) : super(key: key);
  final List? list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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

  Container _buildRepositoryWidget(repository) {
    return Container(
      color: AppTheme.lightOrange,
      height: 30,
      width: double.infinity,
      child: Text(
        '-${repository.id}  - ${repository.name}',
      ),
    );
  }
}
