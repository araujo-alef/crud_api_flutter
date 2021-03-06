import 'package:crud_api/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consumindo RestAPI',
      theme: ThemeData.dark(),
      initialRoute: '/',
      getPages: AppPages.routes,
    );
  }
}
