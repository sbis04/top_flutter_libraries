import 'package:codemagic_bloc/models/models.dart';
import 'package:dio/dio.dart';

import '../secrets.dart';

class CodemagicApiClient {
  BaseOptions options = new BaseOptions(
      baseUrl: 'https://api.codemagic.io',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        "Content-Type": "application/json",
        "x-auth-token": Secrets.apiToken,
      });

  late Dio _dio;

  Future<Application?> fetchApp() async {
    _dio = new Dio(options);

    try {
      Response response = await _dio.get(
        "/apps/${Secrets.appId}",
      );
      if (response.statusCode == 200) {
        print(response.data);
        final application = Application.fromJson(response.data['application']);
        return application;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
