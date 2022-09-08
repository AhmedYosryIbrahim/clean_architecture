import 'package:clean_architecture/config/routes/app_routes.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/core/utils/constants.dart';
import 'package:clean_architecture/core/utils/media_query_values.dart';
import 'package:clean_architecture/qutes_feature/presentation/widgets/circle_button.dart';
import 'package:clean_architecture/qutes_feature/presentation/widgets/content_container.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../fav_qoutes/presentation/screens/fav_qoutes_screen.dart';

class QutesScreen extends StatelessWidget {
  const QutesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text(AppStrings.appName),
    );
    Widget _buildBody() {
      return Column(
        children: [
          ContentContainer(),
          CircleButton(),
        ],
      );
    }

    return Scaffold(
      appBar: appBar,
      body: _buildBody(),
    );
  }
}
