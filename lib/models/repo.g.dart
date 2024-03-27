// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoAdapter extends TypeAdapter<Repo> {
  @override
  final int typeId = 1;

  @override
  Repo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repo(
      title: fields[1] as String,
      isFavorite: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Repo obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
