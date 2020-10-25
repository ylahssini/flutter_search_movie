import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Movie {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  Movie({ this.title, this.year, this.imdbID, this.poster, this.type });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      imdbID: json['imdbID'],
      type: json['Type'],
      poster: json['Poster'],
    );
  }
}

Future<Movie> getMovies(String value) async {
  final response = await http.get('${DotEnv().env['API_URL']}?s=$value&apikey=${DotEnv().env['API_KEY']}');

  if (response.statusCode == 200) {
    return Movie.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error encoured when loading movies, try again!');
  }
}