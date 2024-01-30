import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:private_movie/bloc/p_movie_repository.dart';

part 'p_movie_event.dart';
part 'p_movie_state.dart';

class PMovieBloc extends Bloc<PMovieEvent, PMovieState> {
  final PMovieRepository repository;
  PMovieBloc(this.repository) : super(PMovieInitial()) {
    on<PMovieEvent>((event, emit) async {
      emit(PMovieLoading());
      try {
        var categories = await repository.loadData();
        emit(PMovieFinishState(categories));
      } catch (e) {
        emit(PMovieError(e.toString()));
        return;
      }
    });
  }
}
