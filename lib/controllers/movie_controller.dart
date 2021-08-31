import 'package:get/get.dart';

class MovieController extends GetxController {
  final titleMovie = "".obs;
  void setMovie(title) {
    titleMovie.value = title;
  }
}