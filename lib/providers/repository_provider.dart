import 'package:flutter/material.dart';
import 'package:gizu_github_app/models/repository.dart';
import 'package:gizu_github_app/service/repository_service.dart';

class RepositoryProvider with ChangeNotifier {
  final repoService = RepositoryService();

  List<Repository> _repositoryList = [];

  List<Repository> get getRepositoryList => _repositoryList;

  bool _loading = false;

  bool get getLoading => _loading;

  Future<void> searchRepos(String v) async {
    _loading = true;
    notifyListeners();
    _repositoryList = await repoService.searchRepos(v);
    _loading = false;
    notifyListeners();
  }
}
