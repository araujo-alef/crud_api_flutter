import 'package:crud_api/app/controllers/movie_controller/movie_controller.dart';
import 'package:get/get.dart';

class MovieBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController());
  }

}