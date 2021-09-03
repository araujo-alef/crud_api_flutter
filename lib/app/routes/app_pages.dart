import 'package:get/get.dart';

import 'package:crud_api/app/bindings/movie_binding.dart';
import 'package:crud_api/app/ui/android/movie/movie_page.dart';
import 'package:crud_api/app/ui/android/home/home_page.dart';
import 'package:crud_api/app/ui/android/add_movie/add_movie.dart';

part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: MovieBindings()),
    GetPage(name: Routes.MOVIE, page: () => Movie(),),
    GetPage(name: Routes.ADDMOVIE, page: () => AddMovie(),),
  ];
}