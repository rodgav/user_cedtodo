// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionCacheAdapterAdapter extends TypeAdapter<SessionCacheAdapter> {
  @override
  final int typeId = 0;

  @override
  SessionCacheAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionCacheAdapter(
      session: fields[0] as models.Session,
      dateTime: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SessionCacheAdapter obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.session)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionCacheAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
