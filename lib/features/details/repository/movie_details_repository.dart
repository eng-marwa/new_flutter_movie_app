import 'package:s1e_flutter_movie_app/core/network/api_service.dart';
import 'package:s1e_flutter_movie_app/features/details/model/trailer_response.dart';

import '../../../core/network/api_result.dart';
import '../model/cast_response.dart';

class MovieDetailsRepository {
  final ApiService _apiService;

  MovieDetailsRepository(this._apiService);

  Future<ApiResult<CastResponse>> getMovieCast(int movieId) async {
    return _apiService.fetchMovieCast(movieId);
  }

  Future<ApiResult<TrailerResponse>> getMovieTrailer(int movieId) async {
    return _apiService.fetchMovieTrailer(movieId);
  }
}
