import 'package:flutter/material.dart';
import 'package:rest_and_navigation/Book.dart';
import 'package:rest_and_navigation/httpFunctions.dart';

class RouteTwo extends StatefulWidget {
  const RouteTwo({super.key, required this.title});

  final String title;

  @override
  State<RouteTwo> createState() => _RouteTwoState();
}

class _RouteTwoState extends State<RouteTwo> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = fetchAllBooks();
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
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            ),
            FutureBuilder<List<Book>>(
              future: futureBooks,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Book> books = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return Text(books[index].toString());
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
