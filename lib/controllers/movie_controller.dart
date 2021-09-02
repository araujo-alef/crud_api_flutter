import 'package:get/get.dart';

class MovieController extends GetxController {
  final titleMovie = "".obs;
  final imageMovie = "".obs;
  final descricaoMovie = "".obs;
  final elencoMovie = "".obs;
  final idMovie = "".obs;

  void setTitle(String title) {
    titleMovie.value = title;
  }
  void setImage(String image) {
    imageMovie.value = image;
  }
  void setDescricao(String descricao) {
    descricaoMovie.value = descricao;
  }
  void setElenco(String elenco) {
    elencoMovie.value = elenco;
  }

  void setMovie(String title, String image, String descricao, String elenco, String id) {
    titleMovie.value = title;
    imageMovie.value = image;
    descricaoMovie.value = descricao;
    elencoMovie.value = elenco;
    idMovie.value = id;
  }

  void cleanMovie() {
    titleMovie.value = "";
    imageMovie.value = "";
    descricaoMovie.value = "";
    elencoMovie.value = "";
    idMovie.value = "";
  }
}