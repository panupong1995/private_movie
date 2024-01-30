import 'package:private_movie/bloc/the_private_movie_db_provider.dart';

class PMovieRepository {
  final ThePrivateMovieDbProvider provider;

  PMovieRepository(this.provider);

  Future<List<String>> loadData() async {
    final data = await provider.loadData();
    return data;
  }
}