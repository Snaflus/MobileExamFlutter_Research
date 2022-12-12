import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_and_testing/main.dart' as app;

void main() { //integration testing
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Firebase login test", () {
    testWidgets('Open firebase route', (tester) async {
      app.main();
      await tester.pumpAndSettle();
    });
  });
}
