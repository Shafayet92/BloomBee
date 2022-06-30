class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Image Based Learning',
    noOfCourses: 55,
    thumbnail: 'img/imagelearning.jpg',
  ),
  Category(
    name: 'Academic Basic Learning',
    noOfCourses: 20,
    thumbnail: 'img/academicbasiclearning.jpg',
  ),
  Category(
    name: 'Parent Tasks',
    noOfCourses: 5,
    thumbnail: 'img/dailytask.jpg',
  ),
  Category(
    name: 'Video Based Learning',
    noOfCourses: 25,
    thumbnail: 'img/videobasedlearning.jpg',
  ),
];
