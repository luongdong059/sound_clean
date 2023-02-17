import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sound_clean/screens/splash/splash_bloc.dart';
import 'package:sound_clean/screens/splash/splash_event.dart';
import 'package:sound_clean/screens/splash/splash_state.dart';
import 'package:sound_clean/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context)..add(GetVersionEvent());
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is GetVersionSuccess)
          BlocProvider.of<SplashBloc>(context)
            ..add(
              GoNavScreensEvent(context: context),
            );
      },
      buildWhen: (previous, current) {
        return current is! GetVersionFaild;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                ClipRRect(
                  child: Center(
                    child: Image.asset('lib/assets/images/logo.png'),
                  ),
                ),
                const Spacer(),
                state is GetVersionSuccess
                    ? Text('version'.tr() + ' ' + state.version.toString())
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
