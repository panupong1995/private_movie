part of 'p_movie_bloc.dart';

@immutable
sealed class PMovieState {}

final class PMovieInitial extends PMovieState {}

class PMovieLoading extends PMovieState {}

class PMovieError extends PMovieState {
  final String message;

  PMovieError(this.message);
}

class PMovieFinishState extends PMovieState {
  final List<String> categories;

  PMovieFinishState(this.categories);
}
