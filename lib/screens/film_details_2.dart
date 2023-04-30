import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/film_details_cubit/film_details_cubit.dart';
import 'package:movies_app/cubits/up_coming_cubit/up_coming_cubit.dart';
import 'package:movies_app/themes/colors.dart';

import '../cubits/now_playing_cubit/now_playing_cubit.dart';

class FilmDetailsTwo extends StatefulWidget {
  final int index;

  FilmDetailsTwo({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<FilmDetailsTwo> createState() => _FilmDetailsState();
}

class _FilmDetailsState extends State<FilmDetailsTwo> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingCubit>().nowPlay();
    context.read<FilmDetailsCubit>().getFlimDetails();
    context.read<UpComingCubit>().listOfUpComing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height*0.65,
                child: BlocBuilder<UpComingCubit, UpComingState>(
                    builder: (context, state) {
                      if (state is UpComingSuccess) {
                        final aflame = state.newAflam.results;
                        return Image.network(
                          'https://image.tmdb.org/t/p/w500/${aflame[widget.index].posterPath}',
                        );
                      }
                      return const SizedBox();
                    }),
              ),

              const SizedBox(
                height: 10,
              ),
              BlocBuilder<UpComingCubit, UpComingState>(
                  builder: (context, state) {
                    if (state is UpComingSuccess) {
                      final aflame = state.newAflam.results;

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${aflame[widget.index].voteAverage}/10',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              aflame[widget.index].overview,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Cast',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
              BlocBuilder<FilmDetailsCubit, FilmDetailsState>(
                  builder: (context, state) {
                    if (state is FilmDetailsFailed) {
                      return const CircularProgressIndicator();
                    }
                    if (state is FilmCastSuccess) {
                      final aflame = state.film.cast;
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: aflame.length,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                  height: 200,
                                  color: Colors.white,
                                  child: Container(
                                    color: Colors.white,
                                    margin:
                                    const EdgeInsets.only(left: 15, right: 15),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25)),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/${aflame[widget.index].profilePath}',
                                      ),
                                    ),
                                  ));
                            }),
                      );
                    }
                    return const SizedBox();
                  }),
              BlocBuilder<FilmDetailsCubit, FilmDetailsState>(
                  builder: (context, state) {
                    if (state is FilmCastSuccess) {
                      final film = state.film.cast;
                      return Text(film[0].name);
                    }return SizedBox();
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
