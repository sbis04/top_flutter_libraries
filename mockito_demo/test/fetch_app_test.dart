import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:mockito_demo/constants/constants.dart';
import 'package:mockito_demo/models/application.dart';
import 'package:mockito_demo/secrets.dart';

import 'fetch_app_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
main() {
  group('fetchApplication', () {
    test('returns an Application if the HTTP call is successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
        Uri.parse(BASE_URL + ENDPOINT),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": apiToken,
        },
      )).thenAnswer((_) async => http.Response(
            '{"application":{"_id": "1","appName":"sign_in_flutter","lastBuildId":"123"}}',
            200,
          ));

      expect(await fetchApps(client), isA<Application>());
    });

    test('throws an exception if the HTTP call returns an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(
        Uri.parse(BASE_URL + ENDPOINT),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": apiToken,
        },
      )).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchApps(client), throwsException);
    });
  });
}
