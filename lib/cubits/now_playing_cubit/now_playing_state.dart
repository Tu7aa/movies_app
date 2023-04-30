part of 'now_playing_cubit.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingSuccess extends NowPlayingState {
  NowPlaying aflam;

  NowPlayingSuccess(this.aflam);
}
