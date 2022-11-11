import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecases.dart';
import '../../domain/entities/quotes.dart';
import '../../domain/use_cases/get_random_quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuotes getRandomQuotes;

  RandomQuoteCubit({
    required this.getRandomQuotes,
  }) : super(RandomQuoteInitial());

  void getRandomQuote() async {
    emit(RandomQuoteLoading());
    final Either<Failures, Quotes> response = await getRandomQuotes(NoParams());

    response.fold(
      (failure) => emit(RandomQuoteError(message: _failureToString(failure))),
      (quotes) => emit(RandomQuoteLoaded(quotes: quotes)),
    );
  }

  String _failureToString(Failures failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMessage;
      case CachedFailure:
        return AppStrings.cachedFailureMessage;
      default:
        return AppStrings.unexpectedErrorMessage;
    }
  }
}
