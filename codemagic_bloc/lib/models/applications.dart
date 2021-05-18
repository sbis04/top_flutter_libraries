import 'package:equatable/equatable.dart';

class Application extends Equatable {
  final String? id;
  final String? appName;
  final String? iconUrl;
  final String? lastBuildId;

  Application({
    this.id,
    this.appName,
    this.iconUrl,
    this.lastBuildId,
  });

  @override
  List<Object?> get props => [id, appName, iconUrl, lastBuildId];

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        id: json["_id"],
        appName: json["appName"],
        iconUrl: json["iconUrl"],
        lastBuildId: json["lastBuildId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "appName": appName,
        "iconUrl": iconUrl,
        "lastBuildId": lastBuildId,
      };
}
