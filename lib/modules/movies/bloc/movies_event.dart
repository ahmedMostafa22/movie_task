part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class GetLatestMovies extends MoviesEvent {}
