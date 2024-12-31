import 'package:hive/hive.dart';

class MapStringAdapter extends TypeAdapter<Map<String, String>> {
  @override
  final int typeId = 1; // Unique ID for this adapter

  @override
  Map<String, String> read(BinaryReader reader) {
    final length = reader.readInt();
    final map = <String, String>{};
    for (int i = 0; i < length; i++) {
      final key = reader.readString();
      final value = reader.readString();
      map[key] = value;
    }
    return map;
  }

  @override
  void write(BinaryWriter writer, Map<String, String> obj) {
    writer.writeInt(obj.length);
    obj.forEach((key, value) {
      writer.writeString(key);
      writer.writeString(value);
    });
  }
}