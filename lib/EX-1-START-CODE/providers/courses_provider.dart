import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/courses_repository.dart';

class CoursesProvider with ChangeNotifier {
  CoursesProvider(this._repository);
  final CoursesRepository _repository;

  List<Course> getCourses(){
    return _repository.getCourses();
  }

  Course getCourseFor(String courseId){
    final courses = _repository.getCourses();
    final course = courses.firstWhere(
      (c) => c.name == courseId,
      orElse: () => Course(name: courseId),
    );
    return course;
  }
  void addScore(String courseId, CourseScore score){
    final course = getCourseFor(courseId);
    _repository.addScore(course, score);
    notifyListeners();
  }
}
