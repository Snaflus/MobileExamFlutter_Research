import 'package:flutter/material.dart';
import 'package:rest_and_navigation/Book.dart';
import 'package:rest_and_navigation/httpFunctions.dart';
import 'package:rest_and_navigation/route_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Get a Book'),
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
  late Future<Book> futureBook;

  @override
  void initState() {
    super.initState();
    futureBook = fetchBook(0);
  }

  final textController = TextEditingController();

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
            TextField(
              decoration: InputDecoration(hintText: 'input book id here'),
              controller: textController,
            ),
            ElevatedButton(
              onPressed: () {
                var value = int.parse(textController.text);
                setState(() {
                  futureBook = fetchBook(value);
                });
              },
              child: const Text('Submit'),
            ),
            FutureBuilder<Book>(
              future: futureBook,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.toString());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RouteTwo(
                            title: "Flutter Demo Get All Books")));
              },
              child: const Text('See all books'),
            ),
          ],
        ),
      ),
    );
  }
}
