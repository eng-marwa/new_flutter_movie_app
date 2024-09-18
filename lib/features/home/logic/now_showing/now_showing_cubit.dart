import 'package:s1e_flutter_movie_app/features/home/logic/now_showing/now_showing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/movie_repository.dart';

class NowShowingCubit extends Cubit<NowShowingState> {
  final MovieRepository _movieRepository;
  NowShowingCubit(this._movieRepository) : super(Initial());

  void emitNowShowingState() {
    emit(Loading());
    _movieRepository.getNowShowingMovies().then((result) {
      result.when(
          success: (data) => emit(Success(data)),
          failure: (e) => emit(Error(e)));
    });
  }
}
