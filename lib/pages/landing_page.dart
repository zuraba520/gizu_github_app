import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gizu_github_app/providers/repository_provider.dart';
import 'package:gizu_github_app/widgets/app_bars/default_app_bar.dart';
import 'package:gizu_github_app/widgets/text_fields/default_text_field.dart';
import 'package:provider/provider.dart';

import 'package:gizu_github_app/theme/theme.dart';
import 'package:gizu_github_app/widgets/lists/repository_list.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/landing';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _controller = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    debugPrint('initState');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    debugPrint('dispose');
    super.dispose();
  }

  void _search(v) {
    _debounce = Timer(const Duration(milliseconds: 500), () {
      Provider.of<RepositoryProvider>(context, listen: false).searchRepos(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        themeSwitcher: true,
        hasBackBtn: false,
      ),
      body: Column(
        children: [
          _buildTextField(),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Consumer<RepositoryProvider>(
              builder: (__, repoProvider, _) {
                return RepositoryList(
                  list: repoProvider.getRepositoryList,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect _buildTextField() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(45),
      ),
      child: Container(
        color: AppTheme.lightOrange,
        padding: const EdgeInsets.all(16),
        height: 100,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: AppTheme.white,
            child: DefaultTextField(
                controller: _controller, onChanged: _search, hint: 'search'),
          ),
        ),
      ),
    );
  }
}
