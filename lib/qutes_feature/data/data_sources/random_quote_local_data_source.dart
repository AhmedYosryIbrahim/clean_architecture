import 'dart:convert';

import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastQuote();

  Future<void> cachedLastQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);

    if (jsonString != null) {
      final cachedRandomQuote =
          Future.value(QuoteModel.fromJson(jsonDecode(jsonString)));
      return cachedRandomQuote;
    } else {
      throw CachedException();
    }
  }

  @override
  Future<void> cachedLastQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, jsonEncode(quote));
  }
}
