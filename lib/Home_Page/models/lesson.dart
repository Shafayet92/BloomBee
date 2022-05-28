class Lesson {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;

  Lesson({
    required this.duration,
    required this.isCompleted,
    required this.isPlaying,
    required this.name,
  });
}

List<Lesson> lessonList = [
  Lesson(
    duration: '11 min 20 sec',
    isCompleted: true,
    isPlaying: true,
    name: "Introduction to Family",
  ),
  Lesson(
    duration: '10 min 11 sec',
    isCompleted: false,
    isPlaying: false,
    name: "Animal Kingdom",
  ),
  Lesson(
    duration: '7 min',
    isCompleted: false,
    isPlaying: false,
    name: "Learn Fruits",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "Learn Food Name",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "Vegetables Name",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "Tree",
  )
];
