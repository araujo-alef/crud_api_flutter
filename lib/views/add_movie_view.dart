import 'package:crud_api/controllers/movie_controller.dart';
import 'package:crud_api/models/filme_model.dart';
import 'package:crud_api/views/home_page_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;

class AddMovie extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
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

Future<ApiResp> editMovie(
    String nome, String foto, String descricao, String elenco, String id) async {
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

class _AddMovieState extends State<AddMovie> {

  @override
  Widget build(BuildContext context) {
    final movie = Get.Get.put(MovieController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Filme'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
        child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: movie.titleMovie.value,
                    onChanged: (text) => movie.setTitle(text),
                    decoration: InputDecoration(
                        labelText: "Nome", border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: movie.imageMovie.value,
                    onChanged: (text) => movie.setImage(text),
                    decoration: InputDecoration(labelText: "Link da foto", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: movie.descricaoMovie.value,
                    onChanged: (text) => movie.setDescricao(text),
                    decoration: InputDecoration(labelText: "Descrição", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: movie.elencoMovie.value,
                    onChanged: (text) => movie.setElenco(text),
                    decoration: InputDecoration(labelText: "Elenco", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      final nome = movie.titleMovie.value;
                      final foto = movie.imageMovie.value;
                      final descricao = movie.descricaoMovie.value;
                      final elenco = movie.elencoMovie.value;

                      if(movie.idMovie.value == "") {
                        await addMovie(nome, foto, descricao, elenco);
                      } else {
                        final id = movie.idMovie.value;
                        await editMovie(nome, foto, descricao, elenco, id);
                      }
                      movie.cleanMovie();
                      Get.Get.to(HomePage());
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}
