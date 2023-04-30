import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/repo/home_playing_repo.dart';

import '../../model/movies_model.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());
  void getAllMovie ()async{
    final allMovies= await HomePlayingRepository().allMovies();
    emit(GetMovies(allMovies));
  }
}
