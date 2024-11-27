import 'package:flutter/material.dart';
import 'package:flutter_theme_preview/home_provider.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      builder: (providerContext, child) {
        final themeProvider = Provider.of<ThemeProvider>(providerContext);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Material Preview',
          theme: themeProvider.getCurrentTheme(),
          themeMode: themeProvider.themeMode,
          home: const HomePage(),
        );
      },
    );
  }
}
