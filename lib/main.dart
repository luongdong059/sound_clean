import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sound_clean/configs/app_configs.dart';
import 'package:sound_clean/generated/l10n.dart';
import 'package:sound_clean/screens/splash/splash_screen.dart';
import 'package:sound_clean/themes/theme.dart';
import 'package:sound_clean/utils/routers/routers.dart';
import 'package:sound_clean/utils/routers/routers_name.dart';

import 'blocs/blocs_export.dart';

void main() async {
  AppConfigs(
    Flavor.production,
  );
  await AppConfigs.instance.setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalizationBloc()
            ..add(
              const LocalizationInitialEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appStateLang = context.watch<LocalizationBloc>().state;
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: appStateLang.locale,
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.light,
      initialRoute: RouterName.root,
      onGenerateRoute: (settings) => Routers.generateRoute(settings),
    );
  }
}
