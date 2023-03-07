import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sound_clean/generated/l10n.dart';
import 'package:sound_clean/screens/splash/splash_screen.dart';
import 'package:sound_clean/themes/theme.dart';

import 'blocs/blocs_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => MultiBlocProvider(
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
          )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appStateLang = context.watch<LocalizationBloc>().state;
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: appStateLang.locale,
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
