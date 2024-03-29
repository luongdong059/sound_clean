import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sound_clean/blocs/clear_bloc/clear_bloc.dart';
import 'package:sound_clean/blocs/splash_bloc/splash_bloc.dart';
import 'package:sound_clean/screens/clear/clear_screen.dart';
import 'package:sound_clean/screens/measure/measure_screen.dart';
import 'package:sound_clean/screens/setting/setting_screen.dart';
import 'package:sound_clean/screens/splash/splash_screen.dart';
import 'package:sound_clean/utils/routers/routers_name.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(
          settings,
          BlocProvider(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          ),
        );
      case RouterName.ClearScreen:
        return _buildRoute(
          settings,
          MultiBlocProvider(providers: [
            BlocProvider(create: (BuildContext context) => ClearBloc())
          ], child: ClearScreen()),
        );
      case RouterName.MeasureScreen:
        return _buildRoute(
          settings,
          MeasureScreen(),
        );
      case RouterName.SettingsScreen:
        return _buildRoute(
          settings,
          SettingScreen(),
        );
      default:
        return _errorRoute(settings);
    }
  }

  static CupertinoPageRoute _buildRoute(
      RouteSettings settings, Widget builder) {
    return CupertinoPageRoute(
        settings: settings, builder: (BuildContext context) => builder);
  }

  static Route _errorRoute(RouteSettings settings) {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
