import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({Key? key}) : super(key: key);

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
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'ahmed yosry',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
