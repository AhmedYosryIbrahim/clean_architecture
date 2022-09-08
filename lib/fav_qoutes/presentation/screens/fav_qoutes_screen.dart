import 'package:flutter/material.dart';

class FavQuotesScreen extends StatelessWidget {
  final String? data;

  FavQuotesScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data ?? 'FavQuotesScreen'),
      ),
    );
  }
}
