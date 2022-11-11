import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Function() onPressed;
  const CircleButton({Key? key,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.replay,
          color: Colors.white,
        ),
      ),
    );
  }
}
