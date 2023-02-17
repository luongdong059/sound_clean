import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sound_clean/screens/clear/clear_screen.dart';
import 'package:sound_clean/screens/measure/measure_screen.dart';
import 'package:sound_clean/screens/record/record_screen.dart';
import 'package:sound_clean/screens/setting/setting_screen.dart';
import 'package:sound_clean/screens/splash/splash_bloc.dart';
import 'package:sound_clean/screens/splash/splash_screen.dart';
import 'package:sound_clean/screens/splash/splash_state.dart';
import 'package:sound_clean/themes/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (context) => SplashBloc())],
    child: EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
      ],
      saveLocale: true,
      path: 'lib/assets/localization',
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins-Regular',
      ),
      home: const SplashScreen(),
    );
  }
}

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Widget> _screenList = <Widget>[
    ClearScreen(),
    MeasureScreen(),
    RecordScreen(),
    SettingScreen()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        // unselectedItemColor: Colors.black,
        iconSize: 30,
        onTap: screenChanger,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_outlined,
            ),
            label: ('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: ('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: ('Account'),
          ),
        ],
      ),
    );
  }

  screenChanger(int value) {
    setState(
      () {
        _currentIndex = value;
      },
    );
  }
}

class SoundClearScreen extends StatelessWidget {
  const SoundClearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _player = AudioPlayer();
    Future<void> playAudio() async {
      _player..setAsset('lib/assets/sounds/165Hz.mp3');
      await _player.play();
    }

    Future<void> stopAudio() async {
      await _player.stop();
    }

    Future<ByteData> loadAsset() async {
      return await rootBundle.load('lib/assets/sounds/165Hz.mp3');
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TextButton(
                child: Text("Press"),
                onPressed: playAudio,
              ),
              TextButton(
                child: Text("Stop"),
                onPressed: stopAudio,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
