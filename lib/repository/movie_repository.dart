import 'dart:convert';

import 'package:flutter_assignment/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
   final String apiKey = "b8352099";
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final res = await http.get(
        Uri.parse(
          'http://www.omdbapi.com/?apikey=$apiKey&s=$query',
        ),
      );

      if (res.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(res.body);

        if (data['Response'] == "True" && data.containsKey('Search')) {
          List<MovieModel> movies = (data['Search'] as List)
              .map((movie) => MovieModel.fromMap(movie))
              .toList();

          for (var movie in movies) {
            var details = await fetchMovieDetails(movie.id);
            movie.rating = details["imdbRating"] ?? "N/A";
            movie.genre = details["Genre"] ?? "Unknown";
          }

          return movies;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> fetchMovieDetails(String imdbID) async {
    try {
      final res = await http.get(
        Uri.parse("http://www.omdbapi.com/?apikey=$apiKey&i=$imdbID"),
      );

      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      return {};
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
