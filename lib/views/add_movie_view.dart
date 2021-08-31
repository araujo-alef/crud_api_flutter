import 'package:crud_api/models/filme_model.dart';
import 'package:crud_api/views/home_page_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;

class AddMovie extends StatefulWidget {

  @override
  _AddMovieState createState() => _AddMovieState();
}

Future<ApiResp> addMovie(String nome, String foto, String descricao, String elenco ) async {
  final dio = Dio();
  try {
    Response response = await dio.post("https://quiet-atoll-29242.herokuapp.com/filme/add", data: {
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

class _AddMovieState extends State<AddMovie> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController fotoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController elencoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Filme'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
          child: Column(
            children: <Widget>[
              SizedBox(height: 18,),
              Text("Nome", textAlign: TextAlign.left,),
              TextField(
                controller: nameController,
              ),
              SizedBox(height: 18,),
              Text("Link da Foto"),
              TextField(
                controller: fotoController,
              ),
              SizedBox(height: 18,),
              Text("Descrição"),
              TextField(
                controller: descricaoController,
              ),
              SizedBox(height: 18,),
              Text("Elenco"),
              TextField(
                controller: elencoController,
              ),
              SizedBox(height: 30,),
              FloatingActionButton(
                onPressed: () async {
                  final nome =  nameController.text;
                  final foto =  fotoController.text;
                  final descricao =  descricaoController.text;
                  final elenco =  elencoController.text;

                  var resp = await addMovie(nome, foto, descricao, elenco);
                  print(resp.toString());
                  Get.Get.to(HomePage());
                },
                child: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}