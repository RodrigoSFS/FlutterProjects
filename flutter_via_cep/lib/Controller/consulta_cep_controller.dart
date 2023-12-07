import 'dart:convert';

import 'package:flutter_via_cep/Model/endereco_model.dart';
import 'package:http/http.dart' as http;

class cepController {
  Future<Endereco> consultaCep(String txtCep) async {
    try {
      String url = "https://viacep.com.br/ws/$txtCep/json/";

      final response = await http.get(Uri.parse(url));

      Map<String, dynamic> retorno = json.decode(response.body);

      print(retorno['localidade']);

      Endereco endereco = Endereco(
        retorno['cep'],
        retorno['logradouro'],
        retorno['complemento'],
        retorno['bairro'],
        retorno['uf'],
        retorno['localidade'],
      );

      return endereco;

    } catch (ex) {
      throw Exception(ex);
    }
  }
}
