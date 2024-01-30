import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:private_movie/bloc/p_movie_bloc.dart';
import 'package:private_movie/log.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<dynamic> categories = [];

  // void loadDataaaa() async {
  //   if (kDebugMode) {
  //     print('Data call');
  //   }
  //   const url = 'https://api.avgle.com/v1/categories';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   setState(() {
  //     categories = json['response']['categories'];
  //   });
  //   if (kDebugMode) {
  //     print('Load Data Complete');
  //   }
  // }

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    //loadData();
    return BlocListener<PMovieBloc, PMovieState>(
      listener: (context, state) async {
        if (state is PMovieError) {
          printLog(state.message);
        }
        Navigator.pop(context);
      },
      child: BlocBuilder<PMovieBloc, PMovieState>(
        builder: (context, state) {
          if (state is PMovieInitial || state is PMovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PMovieFinishState) {
          return Scaffold(
            backgroundColor: Colors.grey.shade800,
            body: Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Column(
                children: [
                  const Text(
                    'Most Popula',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AspectRatio(
                    aspectRatio: 1.91,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView.builder(
                            itemCount: state.categories.length,
                            onPageChanged: (value) {
                              //setState(() {
                                _currentPage = value;
                              //});
                            },
                            itemBuilder: (context, index) {
                              final category = state.categories[index];
                              final coverImages = '';
                              return ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: Image.network(coverImages),
                              );
                            }),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: Row(
                            children: List.generate(
                              state.categories.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: IndicatorDot(
                                  isActive: index == _currentPage,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'New Release',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 300,
                      height: 169,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );} else {
            return Container();
          }
        }, 
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white38,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
