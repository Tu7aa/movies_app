part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class GetMovies extends MoviesState {
  Movies movie;
  GetMovies(this.movie);
}

