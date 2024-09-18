import 'package:s1e_flutter_movie_app/core/network/api_service.dart';
import 'package:s1e_flutter_movie_app/features/home/model/movie_response.dart';

import '../../../core/network/api_result.dart';

class MovieRepository {
  final ApiService _apiService;
  MovieRepository(this._apiService);

  Future<ApiResult<MovieResponse>> getNowShowingMovies() async {
    return await _apiService.fetchNowShowingMovies();
  }

  Future<ApiResult<MovieResponse>> getPopularMovies() async {
    return await _apiService.fetchPopularMovies();
  }
}
