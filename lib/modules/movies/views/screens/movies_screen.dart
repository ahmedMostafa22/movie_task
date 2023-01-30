import 'package:alpha/common_components/loading.dart';
import 'package:alpha/modules/movies/bloc/movies_bloc.dart';
import 'package:alpha/modules/movies/views/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    context.read<MoviesBloc>().add(GetLatestMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Movies'),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (_, state) {
          if (state is MoviesLoaded) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1),
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
