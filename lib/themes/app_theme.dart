import 'package:flutter/material.dart';
import 'package:sound_clean/themes/app_assets.dart';
import 'package:sound_clean/themes/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: AppAssets.font,
      dividerColor: AppColors.black04,
      textTheme: ThemeData().textTheme.apply(
            bodyColor: AppColors.black04,
            displayColor: AppColors.black04,
          ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.black04,
      fontFamily: AppAssets.font,
      dividerColor: AppColors.white,
      textTheme: ThemeData().textTheme.apply(
            bodyColor: AppColors.white,
            displayColor: AppColors.white,
          ),
    );
  }
}
