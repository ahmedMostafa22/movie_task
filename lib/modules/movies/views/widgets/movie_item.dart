import 'package:alpha/constants/network_consts.dart';
import 'package:alpha/modules/movies/models/movie.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Column(
        children: [Text(movie.title), Text(movie.year)],
      ),
      child: Image.network(NetworkConstants.imageBaseUrl + movie.image),
    );
  }
}
