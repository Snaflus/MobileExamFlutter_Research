import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_and_testing/route_firebase.dart';
import 'package:firebase_and_testing/consumer_widgets.dart';
import 'package:firebase_and_testing/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
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
            children: <Widget>[
              CounterDisplay(),
              ExclusiveFeatureForFirebaseUsers(),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  FirebaseAuth.instance.currentUser?.reload();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RouteFirebase(
                              title: "Flutter Demo Firebase")));
                },
                child: const Text('Firebase Login Route'),
              ),
            ],
          ),
        ),
        floatingActionButton: CounterButton());
  }
}
