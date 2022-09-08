import 'package:clean_architecture/config/routes/app_routes.dart';
import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/qutes_feature/presentation/screens/qutes_screen.dart';
import 'package:flutter/material.dart';

import 'config/themes/app_theme.dart';

class QutesApp extends StatelessWidget {
  const QutesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
