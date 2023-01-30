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
            .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
          emit(MoviesLoading());
          await MoviesRepository()
              .getLatestMovies()
              .then((result) => result.fold((e) {
                    Widget errorWidget = ExceptionHandler.getExceptionWidget(
                        e, () => add(event));
                    emit(MoviesError(errorWidget));
                  }, (movies) => emit(MoviesLoaded(movies))));
        } else {}
      }
    });
  }

  @override
  MoviesState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(MoviesState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
  Map<String, dynamic> coursesStateToJson(CoursesState state) {
    return {
      'allCourses': state.allCourses.map((a) => _courseToJson(a)).toList(),
      'classroomId': state.classroomId
    };
  }

  CoursesState coursesStateFromJson(Map<String, dynamic> json) {
    return CoursesState(
        List<Course>.from(
            json['allCourses']?.map((a) => _courseFromJson(a)) ?? []),
        json['classroomId'] ?? '');
  }

  Course _courseFromJson(Map<String, dynamic> json) {
    return Course(
      json['id'],
      json['name'],
      json['image'] ?? '',
      json['classroomId'],
    );
  }

  Map<String, dynamic> _courseToJson(Course course) {
    return {
      'id': course.id,
      'name': course.name,
      'image': course.image,
      'classroomId': course.classroomId
    };
}
