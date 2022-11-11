import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/core/usecases/usecases.dart';
import 'package:clean_architecture/qutes_feature/domain/entities/quotes.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/quote_repository.dart';

class GetRandomQuotes implements UseCase<Quotes, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuotes({required this.quoteRepository});

  @override
  Future<Either<Failures, Quotes>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}

// class LoginParams extends Equatable {
//   final String userName;
//   final String password;
//
//   const LoginParams({required this.userName, required this.password});
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
