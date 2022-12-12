import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_and_testing/providers.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var count = int.tryParse(ref.watch(counterProvider).toString());
    var maxCount = 10;

    return Column(
      children: [
        Text('Button clicks out of $maxCount'),
        LinearProgressIndicator(value: count! / maxCount),
      ],
    );
  }
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var count = ref.watch(counterProvider).toString();

    return Column(
      children: [
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          count,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}

class CounterButton extends ConsumerWidget {
  const CounterButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: ref.read(counterProvider.notifier).increment,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class ExclusiveFeatureForFirebaseUsers extends ConsumerWidget {
  const ExclusiveFeatureForFirebaseUsers({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var firebase = ref.watch(firebaseAuthProvider);
    return Column(
      children: [
        if (firebase.currentUser != null) ...[
          Text("\n"),
          Text(
              "Welcome user ${firebase.currentUser?.email.toString()}"),
          ProgressBar(),
          Text("\n"),
        ],
      ],
    );
  }
}