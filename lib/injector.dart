import 'package:clean_architecture/core/api/app_interceptors.dart';
import 'package:clean_architecture/core/api/dio_consumer.dart';
import 'package:clean_architecture/core/network_info/network_info.dart';
import 'package:clean_architecture/qutes_feature/data/data_sources/random_quote_local_data_source.dart';
import 'package:clean_architecture/qutes_feature/data/data_sources/random_quote_remote_data_source.dart';
import 'package:clean_architecture/qutes_feature/data/repositories/quote_repository_impl.dart';
import 'package:clean_architecture/qutes_feature/domain/repositories/quote_repository.dart';
import 'package:clean_architecture/qutes_feature/domain/use_cases/get_random_quote.dart';
import 'package:clean_architecture/qutes_feature/presentation/cubit/random_quote_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => RandomQuoteCubit(
      getRandomQuotes: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetRandomQuotes(quoteRepository: sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()),
  );

  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        requestHeader: true,
        error: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
