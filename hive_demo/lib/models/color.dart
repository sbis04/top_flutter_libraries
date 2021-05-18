import 'package:hive/hive.dart';

part 'color.g.dart';

@HiveType(typeId: 0)
class CustomColor {
  @HiveField(0)
  final String colorName;

  @HiveField(1)
  final String colorHex;

  CustomColor({required this.colorName, required this.colorHex});
}
