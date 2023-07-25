class Course {
  final String title;
  final String description;
  final int price;
  final String path;

  Course(this.title, this.description, this.price, this.path);
}
Map<String,List<Course>> courseModel = {
  "درس ها":[
     Course("فلاتر", "اموزش فلاتر",4000000, "assets/images/flutter_tutorial.jpg"),
     Course("فلاتر", "اموزش فلاتر",690000, "assets/images/flutter_tutorial.jpg"),
     Course("فلاتر", "اموزش فلاتر",40000, "assets/images/flutter_tutorial.jpg"),
     Course("فلاتر", "اموزش فلاتر",5000, "assets/images/flutter_tutorial.jpg"),
     Course("فلاتر", "اموزش فلاتر",480000, "assets/images/flutter_tutorial.jpg"),
  ],
   "آموزش فلاتر": [
    Course("فلاتر", "اموزش فلاتر", 4000000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 690000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 40000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 5000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 480000, "assets/images/flutter_tutorial.jpg"),
  ],
   "اموزش زبان": [
    Course("فلاتر", "اموزش فلاتر", 4000000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 690000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 40000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 5000, "assets/images/flutter_tutorial.jpg"),
    Course(
        "فلاتر", "اموزش فلاتر", 480000, "assets/images/flutter_tutorial.jpg"),
  ],
   "آموزش ها": [
    Course("فلاتر", "اموزش فلاتر", 4000000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 690000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 40000, "assets/images/flutter_tutorial.jpg"),
    Course("فلاتر", "اموزش فلاتر", 5000, "assets/images/flutter_tutorial.jpg"),
    Course( "فلاتر", "اموزش فلاتر", 480000, "assets/images/flutter_tutorial.jpg"),
  ],
};
  

