import 'package:app_filmes/data/movie_api.dart';
import 'package:app_filmes/pages/movie_list/movie_list_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt(){
  getIt.registerLazySingleton<MovieApi>(() => MovieApi());
  getIt.registerLazySingleton<MovieListController>(() => MovieListController());

}