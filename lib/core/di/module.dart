import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:s1e_flutter_movie_app/core/network/api_service.dart';
import 'package:s1e_flutter_movie_app/core/network/dio_config.dart';
import 'package:s1e_flutter_movie_app/features/details/logic/cast_cubit/cast_cubit.dart';
import 'package:s1e_flutter_movie_app/features/details/logic/trailer_cubit/trailer_cubit.dart';
import 'package:s1e_flutter_movie_app/features/details/repository/movie_details_repository.dart';
import 'package:s1e_flutter_movie_app/features/home/logic/now_showing/now_showing_cubit.dart';
import 'package:s1e_flutter_movie_app/features/home/logic/popular/popular_cubit.dart';
import 'package:s1e_flutter_movie_app/features/home/repository/movie_repository.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  // Register your dependencies here
  getIt.registerLazySingleton<Dio>(() => DioConfig.getDio());
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl(getIt()));
  getIt.registerFactory<MovieRepository>(() => MovieRepository(getIt()));
  getIt.registerFactory<MovieDetailsRepository>(
      () => MovieDetailsRepository(getIt()));
  getIt.registerLazySingleton<NowShowingCubit>(
    () => NowShowingCubit(getIt()),
  );
  getIt.registerLazySingleton<PopularCubit>(
    () => PopularCubit(getIt()),
  );
  getIt.registerLazySingleton<CastCubit>(
    () => CastCubit(getIt()),
  );
  getIt.registerLazySingleton<TrailerCubit>(
    () => TrailerCubit(getIt()),
  );
}
