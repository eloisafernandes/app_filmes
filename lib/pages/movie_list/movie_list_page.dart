import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/pages/movie_list/movie_list_controller.dart';
import 'package:app_filmes/service_locator.dart';
import 'package:flutter/material.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPage();
}

class _MovieListPage extends State<MovieListPage> {
  final controller = getIt<MovieListController>();

  @override
  void initState() {
    // TODO: implement initState
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search))
        ],

      ),
      body: StreamBuilder<List<Movie>>(
        stream: controller.stream,
        builder:(context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Text("Waiting...");
          }

          var movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];
              return ListTile(
                title: Text(movie.nome),
              );
            },
            
          );
        },
      )

    );
  }
}