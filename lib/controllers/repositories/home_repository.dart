import 'package:crud_api/models/filme_model.dart';
import 'package:dio/dio.dart';

class Api {
  Future<List<FilmeModel>> fetchData() async {
      final dio = Dio();
      try {
        Response response =
          await dio.get("https://quiet-atoll-29242.herokuapp.com/filmes");
        return (response.data as List).map((e) => FilmeModel.fromJson(e)).toList();
      } catch (e) {
        throw Exception("Erro ao buscar dados");
    }
  }
}