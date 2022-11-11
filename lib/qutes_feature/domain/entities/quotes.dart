import 'package:equatable/equatable.dart';

class Quotes extends Equatable {
  final String quote;
  final int id;
  final String author;
  final String permalink;

  const Quotes({
    required this.quote,
    required this.id,
    required this.author,
    required this.permalink,
  });

  @override
  List<Object?> get props => [quote, author];
}
