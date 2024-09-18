import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s1e_flutter_movie_app/features/home/logic/popular/popular_state.dart';

import '../../repository/movie_repository.dart';

class PopularCubit extends Cubit<PopularState> {
  final MovieRepository _movieRepository;
  PopularCubit(this._movieRepository) : super(Initial());

  void emitPopularState() {
    emit(Loading());
    _movieRepository.getPopularMovies().then((result) {
      result.when(
          success: (data) => emit(Success(data)),
          failure: (e) => emit(Error(e)));
    });
  }
}
