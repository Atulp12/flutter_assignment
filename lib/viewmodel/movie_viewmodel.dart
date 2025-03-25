import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/movie_model.dart';
import 'package:flutter_assignment/repository/movie_repository.dart';

class MovieViewmodel extends ChangeNotifier {
  final MovieRepository _movieRepository;

  List<MovieModel> movies = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MovieViewmodel({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      movies = await _movieRepository.searchMovies(query);
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
