

import 'package:app_filmes/data/models/movie.dart';
import 'package:app_filmes/pages/movie_detail/movie_detail_controller.dart';
import 'package:app_filmes/pages/movie_detail/widgets/delete_comment_widget.dart';
import 'package:app_filmes/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MovieDetailCommentWidget extends StatelessWidget {
  MovieDetailCommentWidget({super.key, required this.movie});
  final controller = getIt<MovieDetailController>();

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: movie.comments.length,
      itemBuilder: (context, index){
        var commment = movie.comments[index];
        return ListTile(
          title: Text(
            commment.comment,
            style:Theme.of(context).textTheme.bodyMedium,            
          ),
          subtitle: Row(
            children: [
              
              Text(timeago.format(commment.createdAt)),
              const SizedBox(width: 12),
              const Text("•"),
              TextButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) => DeleteCommentWidget(
                      onDeleted: () async => controller.deleteComment(commment.id),
                    ),
                    
                  );                
                }, 
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                child: const Text('Excluir')
              )
            ]),
        );
      },
      
      );
  }
}