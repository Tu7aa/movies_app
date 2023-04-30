part of 'film_details_cubit.dart';

@immutable
abstract class FilmDetailsState {}

class FilmDetailsInitial extends FilmDetailsState {}


class FilmDetailsSuccess extends FilmDetailsState {
  final MovieCast films;
  FilmDetailsSuccess(this.films);
}
class FilmDetailsFailed extends FilmDetailsState{}

class FilmCastSuccess extends FilmDetailsState {
  final MovieCast film;
  FilmCastSuccess(this.film);
}

class FilmCastFailed extends FilmDetailsState {}
