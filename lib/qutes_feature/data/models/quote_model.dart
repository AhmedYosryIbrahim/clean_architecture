import '../../../qutes_feature/domain/entities/quotes.dart';

class QuoteModel extends Quotes {
  const QuoteModel(
      {required super.quote,
      required super.id,
      required super.author,
      required super.permalink});

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    author: json["author"],
    id: json["id"],
    quote: json["quote"],
    permalink: json["permalink"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "id": id,
    "quote": quote,
    "permalink": permalink,
  };
}
