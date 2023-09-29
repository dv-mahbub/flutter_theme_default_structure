import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_theme/theme/theme_notifier.dart';
import 'package:flutter_theme/views/theme_selector_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final themeNotifier = ThemeNotifier(ThemeData.light(), prefs);
  await themeNotifier.loadTheme();
  await themeNotifier.loadSelectedThemeOption(); // Load the selected theme option

  runApp(
    ChangeNotifierProvider(
      create: (_) => themeNotifier,
      child: const ScreenUtilInit(
        designSize: Size(360, 690),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      home: const ThemeSelectorPage(),
    );
  }
}
