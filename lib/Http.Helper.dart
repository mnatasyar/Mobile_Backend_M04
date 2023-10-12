import 'dart:io';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String _urlKey = "?api_key=cb8d5f67effddfa64697cb415987111e";
  final String _urlBase = "https://api.themoviedb.org";

  Future<String> getMovie(String category) async {
    final Map<String, String> categoryToEndpoint = {
      'Now Playing': '/3/movie/now_playing',
      'Popular': '/3/movie/popular',
      'Top Rated': '/3/movie/top_rated',
      'Upcoming': '/3/movie/upcoming',
      'Latest': '/3/movie/latest',
    };

    final String endpoint = categoryToEndpoint[category] ?? '/3/movie/latest';

    var url = Uri.parse(_urlBase + endpoint + _urlKey);
    http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    }
    return result.statusCode.toString();
  }
}
