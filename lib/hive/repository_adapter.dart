import 'package:hive/hive.dart';

import 'package:gizu_github_app/models/repository.dart';

class RepositoryAdapter extends TypeAdapter<Repository> {

  @override
  final int typeId = 0;


  @override
  Repository read(BinaryReader reader) {
    return Repository(
      id: reader.readInt(),
      name: reader.readString(),
      owner: reader.readString(),
      avatar: reader.readString(),
      ownerUrl: reader.readString(),
      description: reader.readString(),
      gitUrl: reader.readString(),
      star: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Repository obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.owner);
    writer.writeString(obj.avatar);
    writer.writeString(obj.ownerUrl);
    writer.writeString(obj.description);
    writer.writeString(obj.gitUrl);
    writer.writeString(obj.star);
  }
}
