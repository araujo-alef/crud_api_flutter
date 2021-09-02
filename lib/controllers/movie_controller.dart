import 'package:crud_api/controllers/repositories/home_repository.dart';
import 'package:crud_api/models/filme_model.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final listMovie = <FilmeModel>[].obs;

  final titleMovie = "".obs;
  final imageMovie = "".obs;
  final descricaoMovie = "".obs;
  final elencoMovie = "".obs;
  final idMovie = "".obs;

  void fetchList() async {
    Api api = Api();
    final response = await api.fetchData();
    listMovie.assignAll(response);
  }

  void deleteMovie( String id) async {
    Api api = Api();
    await api.deleteMovie(id);
    fetchList();
  }

  void addMovie(String nome, String foto, String descricao, String elenco) async {
    Api api = Api();
    await api.addMovie(nome, foto, descricao, elenco);
    fetchList();
  }

  void editMovie(String nome, String foto, String descricao, String elenco, String id) async {
    Api api = Api();
    await api.editMovie(nome, foto, descricao, elenco, id);
    fetchList();
  }

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