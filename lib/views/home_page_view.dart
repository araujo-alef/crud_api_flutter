import 'package:crud_api/controllers/movie_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_api/models/filme_model.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final movie = Get.put(MovieController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Filmes"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GetX<MovieController>(
            initState: (state) {movie.fetchList();},
            builder: (movie) {
              return
              movie.listMovie.isEmpty
              ?
              Center(child: CircularProgressIndicator(),)
              :
              ListView.builder(
                itemCount: movie.listMovie.length,
                itemBuilder: (context, index) {
                  return
                    ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage("${movie.listMovie[index].foto}"),
                        ),
                        title: Text("${movie.listMovie[index].nome}"),
                        subtitle: Text("${movie.listMovie[index].elenco}"),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                final title = movie.listMovie[index].nome.toString();
                                final image = movie.listMovie[index].foto.toString();
                                final descricao = movie.listMovie[index].descricao.toString();
                                final elenco = movie.listMovie[index].elenco.toString();
                                final id = movie.listMovie[index].id.toString();

                                movie.setMovie(title, image, descricao, elenco, id);

                                Get.toNamed("addMovie");
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.green,
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Excluir'),
                                    content: Text("Deseja realmente excluir este filme?"),
                                    actions: [
                                      TextButton(
                                        onPressed: (){
                                          Get.back();
                                        },
                                        child: Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: (){
                                          final id = movie.listMovie[index].id.toString();
                                          movie.deleteMovie(id);
                                          Get.back();
                                        },
                                        child: Text('Sim, excluir'),
                                      ),
                                    ],
                                  )
                                );
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          final title = movie.listMovie[index].nome.toString();
                          final image = movie.listMovie[index].foto.toString();
                          final descricao = movie.listMovie[index].descricao.toString();
                          final elenco = movie.listMovie[index].elenco.toString();
                          final id = movie.listMovie[index].id.toString();


                          movie.setMovie(title, image, descricao, elenco, id);
                          Get.toNamed('/movie');
                        },
                      );
                  }
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          movie.cleanMovie();
          Get.toNamed('/addMovie');
        },
      ),
    );
  }
}
