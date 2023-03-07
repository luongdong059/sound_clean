import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sound_clean/themes/app_colors.dart';
import '../../blocs/blocs_export.dart';
import '../../generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(const GetVersionEvent());
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is GetVersionSuccess) {
          BlocProvider.of<SplashBloc>(context).add(
            GoNavScreensEvent(context: context),
          );
        }
      },
      buildWhen: (previous, current) {
        return current is! GetVersionFailed;
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
                    ? Text('${S.of(context).version} ${state.version}')
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
