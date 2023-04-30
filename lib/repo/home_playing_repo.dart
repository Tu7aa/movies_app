import 'package:dio/dio.dart';

import '../model/film_details_model.dart';
import '../model/movies_model.dart';
import '../model/now_playind_model.dart';
import '../model/up_coming.dart';

class HomePlayingRepository {
  Future<NowPlaying> nowPlay() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=c211fef8b97fa27a673ac4cca58b1183&language=en-US&page=1');
    final aflamNow = NowPlaying.fromJson(response.data);
    return aflamNow;
  }

  Future<UpComing> upComingFilm() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=c211fef8b97fa27a673ac4cca58b1183&language=en-US&page=1');
    final newFilms = UpComing.fromJson(response.data);
    return newFilms;
  }

  Future<MovieCast> filmDetail() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/550/credits?api_key=c211fef8b97fa27a673ac4cca58b1183&language=en-US');
    final listOfDetails = MovieCast.fromJson(response.data);
    return listOfDetails;
  }
  Future<MovieCast> movieCast({required int movieId})async{
    final response =await Dio().get('https://api.themoviedb.org/3/movie/$movieId/credits?api_key=c211fef8b97fa27a673ac4cca58b1183&language=en-US');
    final listOfCast=MovieCast.fromJson(response.data);
    return listOfCast;
  }

  Future<Movies> allMovies() async {
    final reponse = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?api_key=c211fef8b97fa27a673ac4cca58b1183&language=en-US&page=1');
     final movie= Movies.fromJson(reponse.data);
     return movie;
  }
}
