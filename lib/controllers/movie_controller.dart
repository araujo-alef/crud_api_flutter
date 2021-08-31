import 'package:get/get.dart';

class MovieController extends GetxController {
  final titleMovie = "".obs;
  final imageMovie = "".obs;
  final decricaoMovie = "".obs;
  final elencoMovie = "".obs;

  void setTilte(String title) {
    titleMovie.value = title;
  }

  void setMovie(String title, String image, String descricao, String elenco) {
    titleMovie.value = title;
    imageMovie.value = image;
    decricaoMovie.value = descricao;
    elencoMovie.value = elenco;
  }
}