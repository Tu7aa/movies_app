import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/now_playind_model.dart';
import '../../repo/home_playing_repo.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());
  void nowPlay ()async{
   final listOfAflam= await HomePlayingRepository().nowPlay();
   emit(NowPlayingSuccess(listOfAflam));

  }
  }
