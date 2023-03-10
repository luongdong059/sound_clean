import 'package:flutter/material.dart';
import 'package:sound_clean/screens/clear/clear_screen.dart';
import 'package:sound_clean/screens/measure/measure_screen.dart';
import 'package:sound_clean/screens/record/record_screen.dart';
import 'package:sound_clean/screens/setting/setting_screen.dart';

import '../themes/theme.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Widget> _screenList = const <Widget>[
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
        elevation: 0,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.black06,
        unselectedItemColor: AppColors.black02,
        iconSize: 30,
        onTap: (index) => _onItemTapped(index),
        items: _getBottomNavigationBar(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBar() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.blur_circular_outlined,
        ),
        label: ('Clear'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.speaker_phone_outlined,
        ),
        label: ('Measure'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.mic_none_outlined),
        label: ('Record'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: ('Setting'),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(
      () {
        _currentIndex = index;
      },
    );
  }
}
