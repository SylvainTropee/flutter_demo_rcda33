class Course {
  String name;
  List<double> notes;

  Course({required this.name, required this.notes});

  double? getAverage() {
    if (notes.isNotEmpty) {
      double total = 0.0;

      // total = notes.reduce((note1, note2) => note1 + note2);
      // notes.forEach((note) => total += note);
      for (var note in notes) {
        total += note;
      }

      print(
          "La moyenne en ${this.name} est ${(total / this.notes.length).toStringAsFixed(2)}");
      return total / this.notes.length;
    }
    return null;
  }
}

double getTotalAverage(List<Course> courses) {
  double total = 0.0;

  for (var course in courses) {
    total += course.getAverage()!;
  }
  return total / courses.length;
}

void main() {
  List<Course> courses = [
    Course(name: "Informatique", notes: [15, 18, 20, 20, 16, 0]),
    Course(name: "Français", notes: [5, 8, 0, 0, 16, 10]),
  ];

  var average = getTotalAverage(courses);
  print("La moyenne totale est de ${average.toStringAsFixed(2)}");
}
