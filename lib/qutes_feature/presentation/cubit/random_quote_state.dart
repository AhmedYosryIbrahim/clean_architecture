part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final Quotes quotes;

  RandomQuoteLoaded({required this.quotes});
}

class RandomQuoteError extends RandomQuoteState {
  final String message;

  RandomQuoteError({required this.message});
}
