import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/pages/movie_detail/movie_detail_controller.dart';
import 'package:app_filmes/pages/movie_detail/widgets/add_comment_widget.dart';
import 'package:app_filmes/pages/movie_detail/widgets/movie_detail_about_widget.dart';
import 'package:app_filmes/pages/movie_detail/widgets/movie_detail_comments_widget.dart';
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
      backgroundColor: Color.alphaBlend(Colors.black12, Theme.of(context).scaffoldBackgroundColor,),
      body: StreamBuilder<Movie>(
        initialData: widget.movie,
        stream: controller.stream,
        builder:(context, snapshot) {
          var movie = snapshot.data!;
          return CustomScrollView(
            slivers: [
              MovieDetailCoverWidget(movie: movie),
              MovieDetailAboutWidget(movie: movie),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Text(
                    "Comentários",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                
                
              ),
              if (snapshot.connectionState == ConnectionState.waiting)
                const SliverToBoxAdapter(
                  child: ProgressIndicatorWidget(),
                )
              else if(movie.comments.isEmpty)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Seja o primeiro a comentar',
                      style: Theme.of(context).textTheme.bodySmall,
                     ),
                  ),
                  
                )
              else MovieDetailCommentWidget(movie: movie),
              const AddCommentWidget(),
              

            ],
          );
        },
      )

    );
  }
}