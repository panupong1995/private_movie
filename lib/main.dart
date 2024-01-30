import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:private_movie/bloc/p_movie_bloc.dart';
import 'package:private_movie/bloc/p_movie_repository.dart';
import 'package:private_movie/bloc/the_private_movie_db_provider.dart';
import 'package:private_movie/home_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => PMovieBloc(PMovieRepository(ThePrivateMovieDbProvider())),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
