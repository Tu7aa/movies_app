import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/model/film_details_model.dart';
import 'package:movies_app/repo/home_playing_repo.dart';

part 'film_details_state.dart';

class FilmDetailsCubit extends Cubit<FilmDetailsState> {
  FilmDetailsCubit() : super(FilmDetailsInitial());

  void getFlimDetails() async {
    try {
      final detailsAboutFilm = await HomePlayingRepository().filmDetail();
      emit(FilmDetailsSuccess(detailsAboutFilm));
    } catch (e) {
      print("Abo Om El Error => $e");
      emit(FilmDetailsFailed());
    }
  }

  void getFlimCast({
    required int movieId,
  }) async {
    try {
      final filmCast =
          await HomePlayingRepository().movieCast(movieId: movieId);
      emit(FilmDetailsSuccess(filmCast));
    } catch (e) {
      print("Abo Om El Error => $e");
      emit(FilmDetailsFailed());
    }
  }
}
