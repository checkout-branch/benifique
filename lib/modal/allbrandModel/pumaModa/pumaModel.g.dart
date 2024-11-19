// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pumaModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdidasmodalAdapter extends TypeAdapter<Adidasmodal> {
  @override
  final int typeId = 4;

  @override
  Adidasmodal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Adidasmodal(
      puma: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Adidasmodal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.puma);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdidasmodalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
