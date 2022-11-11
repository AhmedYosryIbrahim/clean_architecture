import 'package:clean_architecture/config/routes/app_routes.dart';
import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/core/utils/constants.dart';
import 'package:clean_architecture/core/utils/media_query_values.dart';
import 'package:clean_architecture/qutes_feature/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_architecture/qutes_feature/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_architecture/qutes_feature/presentation/widgets/circle_button.dart';
import 'package:clean_architecture/qutes_feature/presentation/widgets/content_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QutesScreen extends StatefulWidget {
  const QutesScreen({Key? key}) : super(key: key);

  @override
  State<QutesScreen> createState() => _QutesScreenState();
}

class _QutesScreenState extends State<QutesScreen> {
  void _getRandomQuote() {
    context.read<RandomQuoteCubit>().getRandomQuote();
  }

  AppBar appBar = AppBar(
    title: const Text(AppStrings.appName),
  );

  Widget _buildBody() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteLoading) {
          return const Center(
            child: SpinKitChasingDots(
              color: AppColors.primaryColor,
              size: 50.0,
            ),
          );
        } else if (state is RandomQuoteError) {
          return const Text('Error');
        } else if (state is RandomQuoteLoaded) {
          return Column(
            children: [
              ContentContainer(
                quotes: state.quotes,
              ),
              CircleButton(
                onPressed: _getRandomQuote,
              ),
            ],
          );
        } else {
          return const Center(
            child: SpinKitChasingDots(
              color: AppColors.primaryColor,
              size: 50.0,
            ),
          );
        }
      },
    );
  }

  initState() {
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _getRandomQuote();
      },
      child: Scaffold(
        appBar: appBar,
        body: _buildBody(),
      ),
    );
  }
}
