import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_and_testing/providers.dart';
import 'package:firebase_and_testing/main.dart' as app;

void main() {
  test('Counter increment test', () {
    final counter = Counter();
    expect(int.tryParse(counter.toString()), 0);
    counter.increment();
    expect(int.tryParse(counter.toString()), 1);
  });
}
