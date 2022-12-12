import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_and_testing/main.dart' as app;

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    await tester.pumpWidget(const app.MyHomePage(title: 'Flutter Route made by WidgetTest'));
    expect(find.text("Flutter Route made by WidgetTest"), findsOneWidget);
  });
}