import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mockito_demo/constants/constants.dart';

import '../secrets.dart';

class Application {
  final String id;
  final String appName;
  final String iconUrl;
  final String lastBuildId;

  Application({
    this.id,
    this.appName,
    this.iconUrl,
    this.lastBuildId,
  });

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

Future<dynamic> fetchApps(http.Client client) async {
  final response = await client.get(
    BASE_URL + ENDPOINT,
    headers: {
      "Content-Type": "application/json",
      "x-auth-token": API_TOKEN,
    },
  );

  if (response.statusCode == 200) {
    print(response.body);

    var jsonData = json.decode(response.body);
    final codemagicInfo = Application.fromJson(jsonData['application']);

    return codemagicInfo;
  } else {
    print('Failed to fetch applications');
    throw Exception();
  }
}
