import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

// An annotation for the code generator to know that this class needs the
// JSON serialization logic to be generated.
@JsonSerializable()
class Application {
  // To specify that JSON must contain the key,
  // if the key doesn't exist, an exception is thrown.
  // Also as the key name is different than the
  // variable name, so it is specified
  @JsonKey(required: true, name: '_id')
  final String id;
  final String appName;
  final String? iconUrl;
  final String? lastBuildId;

  Application({
    required this.id,
    required this.appName,
    this.iconUrl,
    this.lastBuildId,
  });

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
