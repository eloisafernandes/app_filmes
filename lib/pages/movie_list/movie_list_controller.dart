import 'dart:async';

import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/data/movie_api.dart';
import 'package:app_filmes/service_locator.dart';

class MovieListController{
  final api = getIt<MovieApi>();

  final _controller =  StreamController<List<Movie>>();

  Stream<List<Movie>> get stream => _controller.stream;


  void init(){
    getMovies();

  }

  void getMovies() async{
    var result = await api.getMovies();
    print(result);
    _controller.sink.add(result);
  }
}