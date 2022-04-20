import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

import 'package:test/src/app.dart';
import 'package:test/src/utils/json_cleaner.dart';

void main() {
  var url = Uri.https('coderbyte.com', 'api/challenges/json/json-cleaning', {});

  testWidgets('JSON Clean up works', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final mockHTTPClient = MockClient((request) async {
        final response = {
          "text":
              "22834 is the feet above sea level of the highest mountain  in the Western Hemisphere, Mount Aconcagua in Argentina.",
          "number": "N/A",
          "found": "true",
          "type": "",
          "trivia": "-"
        };
        return http.Response(jsonEncode(response), 200);
      });
      final response = (await mockHTTPClient.get(url)).body;
      final responseCleaned = cleanJson(response);
      final expectedJson = {
        "text":
            "22834 is the feet above sea level of the highest mountain  in the Western Hemisphere, Mount Aconcagua in Argentina.",
        "found": "true",
      };
      expect(responseCleaned, expectedJson);
    });
  });

  testWidgets('Show JSON cleaned', (WidgetTester tester) async {
    await tester.pumpWidget(const Test());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);

  });
}

