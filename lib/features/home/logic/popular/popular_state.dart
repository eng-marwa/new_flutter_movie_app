import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s1e_flutter_movie_app/core/network/api_exception.dart';

part 'popular_state.freezed.dart';

@freezed
class PopularState<T> with _$PopularState {
  factory PopularState.initial() = Initial;

  factory PopularState.loading() = Loading;

  factory PopularState.success(T data) = Success<T>;

  factory PopularState.error(ApiException e) = Error;
}
