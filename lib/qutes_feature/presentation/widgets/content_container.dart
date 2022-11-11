import 'package:clean_architecture/qutes_feature/domain/entities/quotes.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class ContentContainer extends StatelessWidget {
  final Quotes quotes;

  const ContentContainer({Key? key, required this.quotes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            quotes.quote,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            quotes.author,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
