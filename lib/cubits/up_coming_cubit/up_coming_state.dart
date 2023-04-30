part of 'up_coming_cubit.dart';

@immutable
abstract class UpComingState {}

class UpComingInitial extends UpComingState {}

class UpComingSuccess extends UpComingState {
  UpComing newAflam;

  UpComingSuccess(this.newAflam);

}