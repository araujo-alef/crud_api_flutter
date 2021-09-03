import 'package:crud_api/app/data/models/filme_model.dart';
import 'package:dio/dio.dart';

class Api {
  Future<List<FilmeModel>> fetchData() async {
    final dio = Dio();
    try {
      Response response =
          await dio.get("https://quiet-atoll-29242.herokuapp.com/filmes");
      return (response.data as List)
          .map((e) => FilmeModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception("Erro ao buscar dados");
    }
  }

  Future<ApiResp> deleteMovie(String id) async {
    final dio = Dio();
    try {
      Response response = await dio.delete(
          "https://quiet-atoll-29242.herokuapp.com/filme/delete",
          data: {
            "id": id,
          });
      return ApiResp.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResp> addMovie(
      String nome, String foto, String descricao, String elenco) async {
    final dio = Dio();
    try {
      Response response = await dio
          .post("https://quiet-atoll-29242.herokuapp.com/filme/add", data: {
        "nome": nome,
        "foto": foto,
        "descricao": descricao,
        "elenco": elenco,
      });
      return ApiResp.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResp> editMovie(String nome, String foto, String descricao,
      String elenco, String id) async {
    final dio = Dio();
    try {
      Response response = await dio
          .patch("https://quiet-atoll-29242.herokuapp.com/filme/edit", data: {
        "nome": nome,
        "foto": foto,
        "descricao": descricao,
        "elenco": elenco,
        "id": id,
      });
      return ApiResp.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
