import 'dart:convert';
import 'package:http/http.dart' as http;

class JikanApiService {
  final String _baseUrl = 'https://api.jikan.moe/v4';

  Future<Map<String, dynamic>> getAnimeById(int animeId) async {
    final response = await http.get(Uri.parse('$_baseUrl/anime/$animeId'));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body)['data'];
      return responseData;
    } else {
      throw Exception('Failed to load anime details');
    }
  }
}
