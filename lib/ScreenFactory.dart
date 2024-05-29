import 'package:agen/Courses.dart';
import 'package:agen/Downloads.dart';
import 'package:agen/Screen.dart';
import 'package:agen/Template.dart';

class Screenfactory {
  static Screen create(String screen){
    switch(screen){
      case "Courses":
      return Courses();
      case "Template":
      return Template();
      case "Downloads":
      return Downloads();
      default:
      return Courses();
    }
  }
}