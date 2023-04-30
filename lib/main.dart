import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/up_coming_cubit/up_coming_cubit.dart';
import 'package:movies_app/screens/home_screen.dart';

import 'cubits/film_details_cubit/film_details_cubit.dart';
import 'cubits/movies_cubit/movies_cubit.dart';
import 'cubits/now_playing_cubit/now_playing_cubit.dart';



void main() {

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => NowPlayingCubit()),
    BlocProvider(create: (context) => UpComingCubit()),
    BlocProvider(create: (context) => MoviesCubit()),
    BlocProvider(create: (context) => FilmDetailsCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
