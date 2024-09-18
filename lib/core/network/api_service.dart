import 'package:dio/dio.dart';
import 'package:s1e_flutter_movie_app/core/network/api_result.dart';
import 'package:s1e_flutter_movie_app/core/network/constants.dart';
import 'package:s1e_flutter_movie_app/features/details/model/cast_response.dart';
import 'package:s1e_flutter_movie_app/features/details/model/trailer_response.dart';
import 'package:s1e_flutter_movie_app/features/home/model/movie_response.dart';

import 'api_exception.dart';

abstract class ApiService {
  Future<ApiResult<MovieResponse>> fetchNowShowingMovies();

  Future<ApiResult<MovieResponse>> fetchPopularMovies();

  Future<ApiResult<CastResponse>> fetchMovieCast(int movieId);
  Future<ApiResult<TrailerResponse>> fetchMovieTrailer(int movieId);
}

class ApiServiceImpl implements ApiService {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<ApiResult<MovieResponse>> fetchNowShowingMovies() async {
    try {
      Response response = await _dio.get(Constants.nowShowingEndPoint);
      if (response.statusCode == 200) {
        return ApiResult<MovieResponse>.success(
            MovieResponse.fromJson(response.data));
      } else {
        return ApiResult<MovieResponse>.failure(
            ApiException.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResult<MovieResponse>.failure(ApiException(
          message: e.message ?? 'Unable to fetch Now Showing Movies',
          code: e.response?.statusCode ?? 0));
    }
  }

  @override
  Future<ApiResult<MovieResponse>> fetchPopularMovies() async {
    try {
      Response response = await _dio.get(Constants.popularEndPoint);
      if (response.statusCode == 200) {
        return ApiResult<MovieResponse>.success(
            MovieResponse.fromJson(response.data));
      } else {
        return ApiResult<MovieResponse>.failure(
            ApiException.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResult<MovieResponse>.failure(ApiException(
          message: e.message ?? 'Unable to fetch Popular Movies',
          code: e.response?.statusCode ?? 0));
    }
  }

  @override
  Future<ApiResult<CastResponse>> fetchMovieCast(int movieId) async {
    try {
      Response response =
          await _dio.get('$movieId/${Constants.movieCastEndPoint}');
      if (response.statusCode == 200) {
        return ApiResult<CastResponse>.success(
            CastResponse.fromJson(response.data));
      } else {
        return ApiResult<CastResponse>.failure(
            ApiException.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResult<CastResponse>.failure(ApiException(
          message: e.message ?? 'Unable to fetch Movie Cast',
          code: e.response?.statusCode ?? 0));
    }
  }

  Future<ApiResult<TrailerResponse>> fetchMovieTrailer(int movieId) async {
    try {
      Response response =
          await _dio.get('$movieId/${Constants.movieTrailerEndPoint}');
      if (response.statusCode == 200) {
        return ApiResult<TrailerResponse>.success(
            TrailerResponse.fromJson(response.data));
      } else {
        return ApiResult<TrailerResponse>.failure(
            ApiException.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResult<TrailerResponse>.failure(ApiException(
          message: e.message ?? 'Unable to fetch Movie Cast',
          code: e.response?.statusCode ?? 0));
    }
  }
}
