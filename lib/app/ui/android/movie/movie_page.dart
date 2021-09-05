import 'package:crud_api/app/controllers/movie_controller/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;

class Movie extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    final movie = Get.Get.put(MovieController());

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.titleMovie.value),
      ),
      body: Container(
        color: Colors.black54,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image(
                  image: NetworkImage(movie.imageMovie.value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40, left: 40),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.red),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Assistir'), Icon(Icons.play_arrow)],
                        ),
                      onPressed: () {},
                  ),
                    )),
                    SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        movie.titleMovie.value,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        movie.descricaoMovie.value,
                        textAlign: TextAlign.justify,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        movie.elencoMovie.value,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  "Assista também",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.listMovie.length,
                    itemBuilder: (context, index) {
                      if(movie.idMovie.value == movie.listMovie[index].id) {
                        return Container();
                      } else {
                        return
                          Container(
                          width: 140,
                          height: 160,                  
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                              child: Image(image: NetworkImage(movie.listMovie[index].foto.toString()), height: 160),
                            ),
                            subtitle: Text(movie.listMovie[index].nome.toString(), textAlign: TextAlign.center,),
                            onTap: () {
                              final title = movie.listMovie[index].nome.toString();
                              final image = movie.listMovie[index].foto.toString();
                              final descricao = movie.listMovie[index].descricao.toString();
                              final elenco = movie.listMovie[index].elenco.toString();
                              final id = movie.listMovie[index].id.toString();

                              movie.setMovie(title, image, descricao, elenco, id);
                              Get.Get.back();
                              Get.Get.toNamed('/movie');
                            },
                          ),
                        );
                      }
                    },
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
