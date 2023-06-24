import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gizu_github_app/models/repository.dart';

class RepositoryService {
  final _host = 'https://api.github.com';

  Future<List<Repository>> searchRepos(String v) async {
    final response = await http.get(
        Uri.parse('$_host/search/repositories?per_page=100&sort=stars&q=$v'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final result = Repository.fromJsonList(data['items']);
      return result;
    } else {
      return [];
    }
  }
}
