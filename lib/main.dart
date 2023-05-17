import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lest/features/auth/auth_screen.dart';
import 'package:lest/features/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(LestApp(savedThemeMode: savedThemeMode));
}

class LestApp extends StatelessWidget {
  const LestApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    final currentTheme = savedThemeMode ?? AdaptiveThemeMode.light;
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: AdaptiveTheme(
        light: ThemeData.light(),
        dark: ThemeData.dark(),
        initial: currentTheme,
        builder: (theme, darkTheme) => MaterialApp.router(
          routerConfig: _router,
          title: 'LEST',
          themeMode: currentTheme.isLight ? ThemeMode.light : ThemeMode.dark,
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
