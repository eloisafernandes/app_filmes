import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/pages/movie_detail/movie_detail_controller.dart';
import 'package:app_filmes/pages/movie_detail/widgets/movie_detail_cover_widget.dart';
import 'package:app_filmes/service_locator.dart';
import 'package:app_filmes/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movie});


  final Movie movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPage();
}

class _MovieDetailPage extends State<MovieDetailPage> {
  final controller = getIt.registerSingleton(MovieDetailController());

  @override
  void initState() {
    controller.init(widget.movie);
    super.initState();
  }

  @override
  void dispose() {
    getIt.unregister(instance: controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<Movie>(
        initialData: widget.movie,
        stream: controller.stream,
        builder:(context, snapshot) {
          var movie = snapshot.data!;
          return CustomScrollView(
            slivers: [
              MovieDetailCoverWidget(movie: movie)
            ],
          );
        },
      )

    );
  }
}