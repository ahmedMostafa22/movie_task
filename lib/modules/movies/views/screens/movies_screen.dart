import 'package:alpha/common_components/loading.dart';
import 'package:alpha/modules/movies/bloc/movies_bloc.dart';
import 'package:alpha/modules/movies/views/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Movies'),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (_, state) {
          if (state is MoviesLoaded) {
            return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (_, i) => MovieItem(movie: state.movies[i]));
          } else if (state is MoviesError) {
            return Center(child: state.errorWidget);
          }
          return const Center(child: Loading());
        },
      ),
    );
  }
}
