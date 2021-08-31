import 'package:crud_api/controllers/movie_controller.dart';
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
      appBar: AppBar(),
      body: Center(child: Text('${movie.titleMovie.value}'),),
    );
  }
}