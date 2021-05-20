// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomColorAdapter extends TypeAdapter<CustomColor> {
  @override
  final int typeId = 0;

  @override
  CustomColor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomColor(
      colorName: fields[0] as String,
      colorHex: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustomColor obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.colorName)
      ..writeByte(1)
      ..write(obj.colorHex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
