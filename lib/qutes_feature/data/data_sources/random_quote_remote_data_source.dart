import 'dart:convert';

import 'package:clean_architecture/core/api/api_consumer.dart';
import 'package:clean_architecture/core/api/end_points.dart';
import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';

import '../models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  final ApiConsumer apiConsumer;

  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(Endpoints.randomQuote);

    return QuoteModel.fromJson(response);
  }
}
