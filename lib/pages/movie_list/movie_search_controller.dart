import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/data/movie_api.dart';
import 'package:app_filmes/service_locator.dart';

class MovieSearchController{
  final api = getIt<MovieApi>();

  Future<List<Movie>> searchMovie(String query) => api.searchMovies(query);
  
}