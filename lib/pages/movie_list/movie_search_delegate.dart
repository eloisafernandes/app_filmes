import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/pages/movie_list/movie_search_controller.dart';
import 'package:app_filmes/pages/movie_list/widgets/movie_item_widget.dart';
import 'package:app_filmes/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{

  final controller = MovieSearchController();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty){
      return buildSuggestions(context);
    }
    else if (query.length < 3){
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Text('A consulta "$query" é curta. O mínimo de caracteres é 3.'),
      );
    }


    return FutureBuilder(
      future: controller.searchMovie(query), 
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const ProgressIndicatorWidget();
        }
        List<Movie> movies = snapshot.data!;

        if(movies.isEmpty){
          return const Center(
            child: Text(
              "Nenhum filme encontrado"
            ),
          );
        }
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieItemWidget(movie: movies[index]);
          }
        );
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }


}