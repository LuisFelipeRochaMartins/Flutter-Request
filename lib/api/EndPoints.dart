import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/Games.dart';
import 'dart:async';

import 'package:trabalho_final/models/Person.dart';

class EndPoints {

  static String api = "http://10.0.2.2:8080/api/person";
  static String steam = "https://store.steampowered.com/wishlist/profiles/76561198796762347/wishlistdata/?p=0&v=202";

  ///
  ///Retorna uma lista de Pessoa que estão cadastradas no Spring Boot
  ///
  static Future<List<Person>> getPersons() async {
      final url = Uri.parse("${api}s");

      try {

        final response = await http.get(
          url,
          headers:{"Content-Type": "application/json"}
        );

        if (response.statusCode == 200) {
          // Realizando o Encoding UFT-8, pois estava dando problema.
          final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
          final List<Person> persons = data.map((item) => Person.fromJson(item)).toList();
          return persons;
        }
      } catch (e) {
        print('Erro na requisição: $e');
      }
      return [];
  }
  
  ///
  /// Faz uma Request para a API em java para adicionar uma nova pessoa ao Banco de dados.
  ///
  static Future<void> addNewPerson(Person person) async {
    final url = Uri.parse(api);

    try {
      http.post(
        url,
        headers:{"Content-Type": "application/json"},
        body: jsonEncode(person)
      );
    } catch (e) {
      print('Erro na Requisição: $e');
    }
  }

  ///
  ///Deleta uma pesssoa baseada no paramêtro.
  ///
  static void deletePerson(int? personId) {
    final url = Uri.parse("$api/$personId");

    try {
      http.delete(url);
    } catch (e) {
      print("Erro na Requisição: $e");
    }
  } 

  static updatePerson(int personId, String email, String name) {
    final url = Uri.parse("$api/$personId");
    var pessoa = Person(email: email,name: name);

    try {
      http.put(
        url,
        headers:{"Content-Type": "application/json"},
        body: jsonEncode(pessoa)
      );
    } catch (e) {
      print("Erro na Requisição: $e");
    }
  } 

  static Future<List<Games>> getWishListGames() async {
  final url = Uri.parse(steam);

  try {
    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));

      final List<Games> games = data.entries.map((entry) {
        final gameData = entry.value as Map<String, dynamic>;
        return Games.fromJson(gameData);
      }).toList();
    
      return games;
    }
  } catch (e) {
    print("Erro na Requisição: $e");
  }

  return [];
}
}