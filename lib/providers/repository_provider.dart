import 'package:flutter/material.dart';
import 'package:gizu_github_app/models/repository.dart';
import 'package:gizu_github_app/service/repository_service.dart';

class RepositoryProvider with ChangeNotifier {
  final repoService = RepositoryService();

  List<Repository> _repositoryList = [];

  List<Repository> get getRepositoryList => _repositoryList;

  Future<void> searchRepos(String v) async {
    _repositoryList = await repoService.searchRepos(v);
    notifyListeners();
  }
}
