import 'package:flutter/material.dart';
import 'package:flutter_theme/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                themeNotifier.setTheme(ThemeData.light());
              },
              child: const Text('Light Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                themeNotifier.setTheme(ThemeData.dark());
              },
              child: const Text('Dark Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                final Brightness systemBrightness = MediaQuery.of(context).platformBrightness;
                themeNotifier.setTheme(systemBrightness == Brightness.light
                    ? ThemeData.light()
                    : ThemeData.dark());
              },
              child: const Text('System Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
