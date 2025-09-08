import 'dart:convert';
import 'package:http/http.dart' as http;

class HpApiService {
  final String baseUrl = "https://hp-api.onrender.com/api";

  Future<List<dynamic>> fetchCharacters() async {
    final response = await http.get(Uri.parse("$baseUrl/characters"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Erro ao carregar personagens");
    }
  }
}
