class Book {
  final int id;
  final String title;
  final double price;

  const Book({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      price: json['price'],
    );
  }

  @override
  String toString() {
    return "ID:$id, Title:$title, Price:$price";
  }
}
