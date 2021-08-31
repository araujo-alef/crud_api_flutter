import 'dart:convert';

class FilmeModel {
    FilmeModel({
        this.id,
        this.nome,
        this.foto,
        this.descricao,
        this.elenco,
        this.v,
    });

    final String? id;
    final String? nome;
    final String? foto;
    final String? descricao;
    final String? elenco;
    final int? v;

    factory FilmeModel.fromRawJson(String str) => FilmeModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FilmeModel.fromJson(Map<String, dynamic> json) => FilmeModel(
        id: json["_id"] == null ? null : json["_id"],
        nome: json["nome"] == null ? null : json["nome"],
        foto: json["foto"] == null ? null : json["foto"],
        descricao: json["descricao"] == null ? null : json["descricao"],
        elenco: json["elenco"] == null ? null : json["elenco"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "foto": foto == null ? null : foto,
        "descricao": descricao == null ? null : descricao,
        "elenco": elenco == null ? null : elenco,
        "__v": v == null ? null : v,
    };
}

class ApiResp {
  final String? resp;

  ApiResp({
    this.resp,
  });
  
  factory ApiResp.fromJson(Map<String, dynamic> json) => ApiResp(
    resp: json["resp"],
  );
}