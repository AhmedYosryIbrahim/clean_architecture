import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/qutes_feature/presentation/screens/qutes_screen.dart';
import 'package:flutter/material.dart';

import '../../fav_qoutes/presentation/screens/fav_qoutes_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String qutesRoute = '/qutes';
}

// final routes = {
//   Routes.initialRoute: (context) => QutesScreen(),
//   Routes.qutesRoute: (context) => FavQuotesScreen(),
// };

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => QutesScreen());
      case Routes.qutesRoute:
        return MaterialPageRoute(builder: (context) => FavQuotesScreen(
          data: settings.arguments as String?,
        ));
      default:
        return undefinedRoute(settings);
    }
  }

  static Route<dynamic> undefinedRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(
                child: Text('${AppStrings.undefinedRoute} ${settings.name}'),
              ),
            ));
  }
}
