import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../models/movie.dart';
import '../services/movie_services.dart';

class MoviesRepository {
  Future<Either<Exception, List<Movie>>> getLatestMovies() =>
      MoviesServices().getLatestMovies().then((result) => result.fold(
          (e) => left(e),
          (response) => right((jsonDecode(response.body)['movies'] as List)
              .map((m) => Movie.fromJson(m))
              .toList())));
}
