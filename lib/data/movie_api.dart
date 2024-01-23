import 'package:app_filmes/data/models/movie.dart';
import 'package:dio/dio.dart';

class MovieApi{
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://apifilmes.webevolui.com'),
  );


  Future<List<Movie>> getMovies({int skip=0, int take=20}) async{
    var response = await _dio.get("/Filme?skip$skip&take=$take");
    
    return (response.data as List).map((item) => Movie.fromJson(item)).toList();
    //return List.empty();
  }
}