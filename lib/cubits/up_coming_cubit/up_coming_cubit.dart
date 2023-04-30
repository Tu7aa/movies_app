import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/up_coming.dart';
import '../../repo/home_playing_repo.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit() : super(UpComingInitial());
  void listOfUpComing ()async {
    final upComingAflam= await HomePlayingRepository().upComingFilm();
    emit(UpComingSuccess(upComingAflam));
  }
}
