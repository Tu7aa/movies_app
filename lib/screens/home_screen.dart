import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';
import 'package:movies_app/cubits/up_coming_cubit/up_coming_cubit.dart';
import 'package:movies_app/screens/film_details.dart';

import '../cubits/now_playing_cubit/now_playing_cubit.dart';
import '../themes/colors.dart';
import 'film_details_2.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingCubit>().nowPlay();
    context.read<UpComingCubit>().listOfUpComing();
    context.read<MoviesCubit>().getAllMovie();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/popcornone.png'),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Now Playing',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: "Cairo"),
                      )
                    ],
                  ),
                ),
                BlocBuilder<NowPlayingCubit, NowPlayingState>(
                    builder: (context, state) {
                  if (state is NowPlayingSuccess) {
                    final aflame = state.aflam.results;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: aflame.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              width: 330,
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return FilmDetails(
                                            index: index,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${aflame[index].backdropPath}',
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  return const SizedBox();
                }),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Up Coming',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: "Cairo"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                BlocBuilder<UpComingCubit, UpComingState>(
                    builder: (context, state) {
                  if (state is UpComingSuccess) {
                    final aflam = state.newAflam.results;
                    return Container(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: aflam.length,
                          itemBuilder: (BuildContext, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                child: GestureDetector(
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${aflam[index].posterPath}',
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return FilmDetailsTwo(
                                            index: index,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  return const SizedBox();
                }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Movies',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: "Cairo"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<MoviesCubit, MoviesState>(
                    builder: (context, state) {
                  if (state is GetMovies) {
                    final movie = state.movie.results;
                    return Container(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.length,
                          itemBuilder: (BuildContext, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500/${movie[index].posterPath}',
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  return const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
