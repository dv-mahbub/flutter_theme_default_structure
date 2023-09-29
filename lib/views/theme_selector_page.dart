import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_theme/constants/spacing.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/theme_selector_container.dart';
import '../theme/theme_notifier.dart';

class ThemeSelectorPage extends StatelessWidget {
  const ThemeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text('Theme', style: TextStyle(color: appBarTittleColor(themeNotifier.currentTheme)),),
          centerTitle: true,
          elevation: 2,
          backgroundColor: themeNotifier.currentTheme==ThemeData.light()?Colors.white10:Colors.black12,
       //   backgroundColor: themeNotifier.currentTheme.scaffoldBackgroundColor
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacing(15.h),
              ThemeSelectorContainer(text: "System"),
              ThemeSelectorContainer(text: "Light"),
              ThemeSelectorContainer(text: "Dark"),
            ],
          ),
        ),
      ),
    );
  }
}
