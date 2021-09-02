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
                        movie.addMovie(nome, foto, descricao, elenco);
                      } else {
                        final id = movie.idMovie.value;
                        movie.editMovie(nome, foto, descricao, elenco, id);
                      }
                      movie.cleanMovie();
                      Get.Get.back();
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
