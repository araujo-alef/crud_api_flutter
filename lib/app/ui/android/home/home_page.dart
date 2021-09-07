import 'package:crud_api/app/controllers/movie_controller/movie_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<MovieController> {
  @override
  Widget build(BuildContext context) {
    final movie = Get.put(MovieController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Cine Movie"),
      ),
      body: Container(
        child: GetX<MovieController>(
          initState: (state) {
            movie.fetchList();
          },
          builder: (movie) {
            final length = movie.listMovie.length - 1;
            return movie.listMovie.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                          height: 280,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                color: Colors.black45,
                                height: 260,
                                child: Image(
                                  image: NetworkImage(movie
                                      .listMovie[length].foto
                                      .toString()),
                                ),
                              ),
                              Container(
                                  height: 260,
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 66,
                                    width: double.infinity,
                                    color: Colors.black.withOpacity(0.2),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(top: 5.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Lançamento',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          Text(
                                              movie.listMovie[length].nome
                                                  .toString(),
                                              style:
                                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,
                                height: 310,
                                child: ElevatedButton(
                                  style: TextButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.6)),
                                  child: Container(
                                    width: 120,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Icon(Icons.play_arrow),
                                      Text('Ver mais')
                                    ],),
                                  ),
                                  onPressed: (){
                                    final title = movie.listMovie[length].nome.toString();
                                    final image = movie.listMovie[length].foto.toString();
                                    final descricao = movie.listMovie[length].descricao.toString();
                                    final elenco = movie.listMovie[length].elenco.toString();
                                    final id = movie.listMovie[length].id.toString();

                                    movie.setMovie(title, image, descricao, elenco, id);
                                     Get.toNamed('/movie');
                                  },
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 16,),
                      Expanded(
                        child: ListView.builder(
                            itemCount: movie.listMovie.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                      "${movie.listMovie[index].foto}"),
                                ),
                                title: Text("${movie.listMovie[index].nome}"),
                                subtitle:
                                    Text("${movie.listMovie[index].elenco}"),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        final title = movie
                                            .listMovie[index].nome
                                            .toString();
                                        final image = movie
                                            .listMovie[index].foto
                                            .toString();
                                        final descricao = movie
                                            .listMovie[index].descricao
                                            .toString();
                                        final elenco = movie
                                            .listMovie[index].elenco
                                            .toString();
                                        final id = movie.listMovie[index].id
                                            .toString();

                                        movie.setMovie(title, image, descricao,
                                            elenco, id);

                                        Get.toNamed("/addMovie");
                                      },
                                      icon: Icon(Icons.edit),
                                      color: Colors.blueGrey,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      color: Colors.red,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text('Excluir'),
                                                  content: Text(
                                                      "Deseja realmente excluir este filme?"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text('Cancelar'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        final id = movie
                                                            .listMovie[index].id
                                                            .toString();
                                                        movie.deleteMovie(id);
                                                        Get.back();
                                                      },
                                                      child:
                                                          Text('Sim, excluir'),
                                                    ),
                                                  ],
                                                ));
                                      },
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  final title =
                                      movie.listMovie[index].nome.toString();
                                  final image =
                                      movie.listMovie[index].foto.toString();
                                  final descricao = movie
                                      .listMovie[index].descricao
                                      .toString();
                                  final elenco =
                                      movie.listMovie[index].elenco.toString();
                                  final id =
                                      movie.listMovie[index].id.toString();

                                  movie.setMovie(
                                      title, image, descricao, elenco, id);
                                  Get.toNamed('/movie');
                                },
                              );
                            }),
                      ),
                    ],
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add),
        onPressed: () {
          movie.cleanMovie();
          Get.toNamed('/addMovie');
        },
      ),
    );
  }
}
