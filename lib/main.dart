import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:lest/core/managers/local_storage_manager.dart';
import 'package:lest/features/home/view/scaffold_with_bars.dart';
import 'package:lest/features/splash/view-model/splash_view_model.dart';
import 'package:lest/product/constants/app_constants.dart';
import 'package:lest/product/constants/navigation_types.dart';
import 'package:lest/product/theme/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await LocalStorage().initialize();
  runApp(const LestApp());
}

class LestApp extends StatelessWidget {
  const LestApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<SplashViewModel>(
            create: (_) => SplashViewModel(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: _router,
          title: AppConstants.appName,
          theme: AppTheme.themeData,
          debugShowCheckedModeBanner: false,
        ),
      );
}

final GoRouter _router = GoRouter(
  routes: [
    NavigationTypes.auth.createGoRoute(),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) =>
          ScaffoldWithBars(child: child),
      routes: <RouteBase>[
        NavigationTypes.home.createGoRoute(
          childrenRoutes: [
            NavigationTypes.productDetail.createGoRoute(
              customPageBuilder:
                  NavigationTypes.productDetail.createPageBuilder,
            ),
          ],
        ),
        NavigationTypes.chat.createGoRoute(
          customPageBuilder: NavigationTypes.chat.createPageBuilder,
        ),
        NavigationTypes.profile.createGoRoute(
          customPageBuilder: NavigationTypes.profile.createPageBuilder,
        ),
        NavigationTypes.settings.createGoRoute(
          customPageBuilder: NavigationTypes.settings.createPageBuilder,
        ),
      ],
    ),
  ],
  redirect: _redirectionLogic,
);

String? _redirectionLogic(BuildContext context, GoRouterState state) {
  final isSignedIn = SplashViewModel.isSignedIn;
  const auth = NavigationTypes.auth;
  if (!isSignedIn && state.location != auth.path) {
    return _router.namedLocation(auth.name);
  } else if (isSignedIn && state.location == auth.path) {
    return _router.namedLocation(NavigationTypes.home.name);
  }
  FlutterNativeSplash.remove();
  return null;
}
