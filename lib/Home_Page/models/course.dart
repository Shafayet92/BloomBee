class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "Team-SoftX",
    completedPercentage: .75,
    name: "Flutter Novice to Ninja",
    thumbnail: "img/flutter.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .60,
    name: "React Novice to Ninja",
    thumbnail: "img/react.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .75,
    name: "Node - The complete guide",
    thumbnail: "img/node.png",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .75,
    name: "Flutter Novice to Ninja",
    thumbnail: "img/flutter.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .60,
    name: "React Novice to Ninja",
    thumbnail: "img/react.jpg",
  ),
  Course(
    author: "Team-SoftX",
    completedPercentage: .75,
    name: "Node - The complete guide",
    thumbnail: "img/node.png",
  ),
];
