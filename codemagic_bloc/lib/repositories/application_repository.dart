import 'package:codemagic_bloc/models/models.dart';
import 'package:codemagic_bloc/repositories/codemagic_api_client.dart';
import 'package:flutter/material.dart';

class ApplicationRepository {
  final CodemagicApiClient codemagicApiClient;

  ApplicationRepository({@required this.codemagicApiClient})
      : assert(codemagicApiClient != null);

  Future<Application> fetchApplication() async {
    return await codemagicApiClient.fetchApp();
  }
}
