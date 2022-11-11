import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/quotes.dart';

abstract class QuoteRepository{
  Future<Either<Failures, Quotes>> getRandomQuote();
}