import 'package:crud_api/views/add_movie_view.dart';
import 'package:crud_api/views/home_page_view.dart';
import 'package:crud_api/views/movie_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Consumindo RestAPI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/addMovie', page: () => AddMovie()),
        GetPage(name: '/movie', page: () => Movie()),
      ],
    );
  }
}
