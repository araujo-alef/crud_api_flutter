import 'package:crud_api/app/controllers/movie_controller/movie_controller.dart';
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
    final _form = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: movie.idMovie.value == "" ? Text('Adicionoar Filme') : Text("Editar filme"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
        child: Form(
          key: _form,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty || value == "") {
                        return "Campo obrigatório";
                      }
                    },
                    initialValue: movie.titleMovie.value,
                    onChanged: (text) => movie.setTitle(text),
                    decoration: InputDecoration(
                        labelText: "Nome", border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty || value == "") {
                        return "Campo obrigatório";
                      }
                    },
                    initialValue: movie.imageMovie.value,
                    onChanged: (text) => movie.setImage(text),
                    decoration: InputDecoration(labelText: "Link da foto", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty || value == "") {
                        return "Campo obrigatório";
                      }
                    },
                    initialValue: movie.descricaoMovie.value,
                    onChanged: (text) => movie.setDescricao(text),
                    decoration: InputDecoration(labelText: "Descrição", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty || value == "") {
                        return "Campo obrigatório";
                      }
                    },
                    initialValue: movie.elencoMovie.value,
                    onChanged: (text) => movie.setElenco(text),
                    decoration: InputDecoration(labelText: "Elenco", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.greenAccent,
                    onPressed: () async {
                      final nome = movie.titleMovie.value;
                      final foto = movie.imageMovie.value;
                      final descricao = movie.descricaoMovie.value;
                      final elenco = movie.elencoMovie.value;

                      final isValid = _form.currentState!.validate();
                      if(isValid) {
                        if(movie.idMovie.value == "") {
                        movie.addMovie(nome, foto, descricao, elenco);
                      } else {
                        final id = movie.idMovie.value;
                        movie.editMovie(nome, foto, descricao, elenco, id);
                      }
                      movie.cleanMovie();
                      Get.Get.back();
                      }
                    },
                    child: movie.idMovie.value == "" ?
                          Icon(Icons.add) :
                          Icon(Icons.verified)
                  ),
                ],
              ),
            ),
        ),
    );
  }
}
