import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/core/network_info/network_info.dart';
import 'package:clean_architecture/qutes_feature/data/data_sources/random_quote_remote_data_source.dart';
import 'package:clean_architecture/qutes_feature/domain/entities/quotes.dart';
import 'package:clean_architecture/qutes_feature/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/random_quote_local_data_source.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl(
      {required this.networkInfo,
      required this.randomQuoteRemoteDataSource,
      required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failures, Quotes>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cachedLastQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localRandomQuote =
            await randomQuoteLocalDataSource.getLastQuote();
        return Right(localRandomQuote);
      } on CachedException {
        return Left(CachedFailure());
      }
    }
  }
}
