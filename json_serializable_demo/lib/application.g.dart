// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['_id']);
  return Application(
    id: json['_id'] as String,
    appName: json['appName'] as String,
    iconUrl: json['iconUrl'] as String,
    lastBuildId: json['lastBuildId'] as String,
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'appName': instance.appName,
      'iconUrl': instance.iconUrl,
      'lastBuildId': instance.lastBuildId,
    };
