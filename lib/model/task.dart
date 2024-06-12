class Task {
  final String title;
  final String description;
  final DateTime date;
  final String category;
  Task(
      {required this.title,
      required this.description,
      required this.date,
      required this.category});
  String toString() {
    return title + " " + description + " " + date.toString() + " " + category;
  }
}
