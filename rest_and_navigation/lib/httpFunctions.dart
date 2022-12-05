import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_and_navigation/Book.dart';

const url = "https://anbo-restbookquerystring.azurewebsites.net/api/Books";

Future<Book> fetchBook(int id) async {
  final response = await http.get(Uri.parse("$url/$id"));

  if (response.statusCode == 200) {
    return Book.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load Book");
  }
}

Future<List<Book>> fetchAllBooks() async {
  List<Book> books = List.empty(growable: true);
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    for (var element in data) {
      books.add(Book(
          id: element['id'], title: element['title'], price: element['price']));
    }
    return books;
  } else {
    throw Exception("Failed to load AllBooks");
  }
}
