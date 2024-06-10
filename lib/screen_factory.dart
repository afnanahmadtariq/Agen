import 'package:agen/courses.dart';
import 'package:agen/downloads.dart';
import 'package:agen/screen.dart';
import 'package:agen/template.dart';

class Screenfactory {
  static Screen create(String screen, String course){
    switch(screen){
      case "Courses":
        return Courses();
      case "Template":
        return Template(course: course);
      case "Downloads":
        return Downloads();
      default:
        return Courses();
    }
  }
}