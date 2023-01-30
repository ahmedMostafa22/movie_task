import 'package:alpha/exceptions/exception_handler.dart';
import 'package:alpha/helpers/shared_prefs.dart';
import 'package:alpha/modules/movies/repository/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends HydratedBloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<MoviesEvent>((event, emit) async {
      if (event is GetLatestMovies) {
        DateTime lastUpdate = await SharedPreferencesHelper.getLastUpdate();
        if (lastUpdate
            .isBefore(DateTime.now().subtract(const Duration(minutes: 1)))) {
          emit(MoviesLoading());
          await MoviesRepository()
              .getLatestMovies()
              .then((result) => result.fold((e) {
                    Widget errorWidget = ExceptionHandler.getExceptionWidget(
                        e, () => add(event));
                    emit(MoviesError(errorWidget));
                  }, (movies) {
                    SharedPreferencesHelper.setLastUpdate(DateTime.now());
                    emit(MoviesLoaded(movies));
                  }));
        }
      }
    });
  }

  @override
  MoviesState? fromJson(Map<String, dynamic> json) {
    print('Fetching movies from cache');
    if (json['movies'] == null) {
      return MoviesInitial();
    }
    return MoviesLoaded(
        List<Movie>.from(json['movies'].map((m) => Movie.fromJson(m)) ?? []));
  }

  @override
  Map<String, dynamic>? toJson(MoviesState state) {
    print('Saving movies to cache');
    if (state is MoviesLoaded) {
      print({'movies': state.movies.map((a) => a.toMap()).toList()});
      return {'movies': state.movies.map((a) => a.toMap()).toList()};
    }
  }
}
