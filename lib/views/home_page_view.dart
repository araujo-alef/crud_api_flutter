import 'package:crud_api/controllers/movie_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:crud_api/models/filme_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Future<ApiResp> deleteMovie(String id) async {
  final dio = Dio();
  try {
    Response response = await dio
        .delete("https://quiet-atoll-29242.herokuapp.com/filme/delete", data: {
      "id": id,
    });
    return ApiResp.fromJson(response.data);
  } catch (e) {
    rethrow;
  }
}

Future<List<FilmeModel>> pegarDados() async {
  final dio = Dio();
  try {
    Response response =
        await dio.get("https://quiet-atoll-29242.herokuapp.com/filmes");
    return (response.data as List).map((e) => FilmeModel.fromJson(e)).toList();
  } catch (e) {
    throw Exception("Erro ao buscar dados");
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final movie = Get.Get.put(MovieController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Filmes"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FutureBuilder<List>(
            future: pegarDados(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return FloatingActionButton(
                  onPressed: () {
                    pegarDados();
                  },
                  child: Center(child: Icon(Icons.replay_outlined)),
                );
              }

              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(snapshot.data![index].foto),
                        ),
                        title: Text(snapshot.data![index].nome),
                        subtitle: Text(snapshot.data![index].elenco),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                final title = snapshot.data![index].nome;
                                final image = snapshot.data![index].foto;
                                final descricao = snapshot.data![index].descricao;
                                final elenco = snapshot.data![index].elenco;
                                final id = snapshot.data![index].id;

                                movie.setMovie(title, image, descricao, elenco, id);

                                Get.Get.toNamed("addMovie");
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.green,
                            ),
                            IconButton(
                              onPressed: () async {
                                final id = snapshot.data![index].id;
                                await deleteMovie(id);
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ],
                        ),
                        onTap: () {
                          final title = snapshot.data![index].nome;
                          final image = snapshot.data![index].foto;
                          final descricao = snapshot.data![index].descricao;
                          final elenco = snapshot.data![index].elenco;
                          final id = snapshot.data![index].id;


                          movie.setMovie(title, image, descricao, elenco, id);
                          Get.Get.toNamed('/movie');
                        },
                      ),
                    );
                  },
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.Get.toNamed('/addMovie');
        },
      ),
    );
  }
}
