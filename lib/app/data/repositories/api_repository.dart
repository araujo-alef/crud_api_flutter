import 'package:crud_api/app/data/provider/api.dart';

class ApiRepository {
  Api api = Api();
  
  fetchData() {
    return api.fetchData();
  }

  deleteMovie(String id) {
    return api.deleteMovie(id);
  }

  addMovie(String nome, String foto, String descricao, String elenco) {
    return api.addMovie(nome, foto, descricao, elenco);
  }

  editMovie(String nome, String foto, String descricao, String elenco, String id) {
    return api.editMovie(nome, foto, descricao, elenco, id);
  }
}
