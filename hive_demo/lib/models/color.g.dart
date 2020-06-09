// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomColorAdapter extends TypeAdapter<CustomColor> {
  @override
  final typeId = 0;

  @override
  CustomColor read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomColor(
      fields[0] as String,
      fields[1] as String,
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
}
