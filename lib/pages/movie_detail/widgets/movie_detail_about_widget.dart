import 'package:app_filmes/data/models/movie.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

class MovieDetailAboutWidget extends StatelessWidget {
  const MovieDetailAboutWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: _buildIcon(Icons.calendar_month_outlined),
                    ),
                    Text('Ano ${movie.year}'),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                      child: _buildIcon(Icons.timer_outlined),
                    ),
                    Text(prettyDuration(
                      Duration(minutes: movie.duration),
                      abbreviated: true,
                      delimiter: ' ',
                      spacer: '',
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                      child: _buildIcon(Icons.category),
                    ),
                    Text(movie.gender),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0,),
            Text(
              "Sinopse",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(movie.description)
          ]
        ),
      ),
    );
  }

  Icon _buildIcon(IconData iconData) =>
      Icon(iconData, color: Colors.amber, size: 20.0);
}
