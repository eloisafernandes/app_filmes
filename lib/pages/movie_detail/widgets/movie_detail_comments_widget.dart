import 'package:app_filmes/data/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MovieDetailCommentWidget extends StatelessWidget {
  const MovieDetailCommentWidget({super.key, required this.movie});


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
              Text("•"),
              TextButton(
                onPressed: (){}, 
                style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                child: const Text('Excluir')
              )
            ]),
        );
      },
      
      );
  }
}