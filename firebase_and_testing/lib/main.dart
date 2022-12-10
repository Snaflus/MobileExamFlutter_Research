import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final counterProvider = StateNotifierProvider((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ProgressBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var count = int.tryParse(ref.watch(counterProvider).toString());
    var maxCount = 10;

    return Column(
      children: [
        Text('\nButton clicks out of $maxCount'),
        LinearProgressIndicator(value: count! / maxCount),
      ],
    );
  }
}

class CounterDisplay extends ConsumerWidget {
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: ref.read(counterProvider.notifier).increment,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CounterDisplay(), ProgressBar()],
          ),
        ),
        floatingActionButton: CounterButton());
  }
}
