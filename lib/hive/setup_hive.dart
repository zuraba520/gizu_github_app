import 'package:gizu_github_app/hive/repository_adapter.dart';
import 'package:gizu_github_app/models/repository.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


Future<void> setupHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(RepositoryAdapter());
  await Hive.openBox<Repository>('favorites');
}
