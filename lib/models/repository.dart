class Repository {
  Repository({
    required this.id,
    required this.name,
    required this.owner,
    required this.avatar,
    required this.ownerUrl,
    required this.description,
    required this.gitUrl,
    required this.star,
  });

  final int id;
  final String name;
  final String owner;
  final String avatar;
  final String ownerUrl;
  final String description;
  final String gitUrl;
  final String star;


  @override
  String toString() {
    return 'Repository(id: $id, name: $name, owner: $owner';
  }

  factory Repository.fromJson(json) {
    final rep = Repository(
      id: json['id'],
      name: json['name'] ?? '',
      owner: json['owner']['login'] ?? '',
      avatar: json['owner']['url'] ?? '',
      ownerUrl: json['owner']['avatar_url'] ?? '',
      description: json['description'] ?? '',
      gitUrl: json['git_url'] ?? '',
      star: json['stargazers_count'].toString(),
    );
    rep.toString();
    return rep;
  }

  static List<Repository> fromJsonList(jsonList) =>
      jsonList.map<Repository>(Repository.fromJson).toList();
}
