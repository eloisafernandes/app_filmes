import 'dart:async';

import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/data/movie_api.dart';
import 'package:app_filmes/service_locator.dart';

class MovieDetailController{
  final api = getIt<MovieApi>();

  final _controller =  StreamController<Movie>();
  late Movie _movie;
  Stream<Movie> get stream => _controller.stream;


  void init(Movie movie){
    _movie = movie;
    getMovie();
  }

  Future<void> getMovie() async{
    var result = await api.getMovie(_movie.id);
    _controller.sink.add(result);
  }
}