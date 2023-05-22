import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lest/features/auth/view/auth_screen.dart';
import 'package:lest/features/chat/chat_screen.dart';
import 'package:lest/features/home/models/product_model.dart';
import 'package:lest/features/home/view/home_screen.dart';
import 'package:lest/features/product/view-model/product_view_model.dart';
import 'package:lest/features/product/view/product_detail_screen.dart';
import 'package:lest/features/profile/profile_screen.dart';
import 'package:lest/features/settings/view/settings_screen.dart';
import 'package:provider/provider.dart';

enum NavigationTypes {
  auth('/', 'auth', []),
  home('/home', 'home', []),
  chat('/chat', 'chat', []),
  profile('/profile', 'profile', []),
  settings('/settings', 'settings', []),
  productDetail('product-detail', 'product-detail', []);

  const NavigationTypes(this.path, this.name, this.children);
  final String path;
  final String name;
  final List<NavigationTypes> children;

  int get homeIndex {
    switch (this) {
      case NavigationTypes.home:
        return 0;
      case NavigationTypes.chat:
        return 1;
      case NavigationTypes.profile:
        return 2;
      case NavigationTypes.settings:
        return 3;
      case NavigationTypes.auth:
      case NavigationTypes.productDetail:
        return 0;
    }
  }
}

mixin NavigationHelpers {
  static NavigationTypes type(int index) => NavigationTypes.values[index + 1];
}

extension NavigationTypesX on NavigationTypes {
  RouteBase createGoRoute({
    List<RouteBase> childrenRoutes = const <RouteBase>[],
    GoRouterWidgetBuilder? customWidgetBuilder,
    GoRouterPageBuilder? customPageBuilder,
  }) =>
      GoRoute(
        name: name,
        path: path,
        builder: customWidgetBuilder ??
            (customPageBuilder == null ? buildWidget : null),
        pageBuilder: customPageBuilder,
        routes: childrenRoutes,
      );

  CustomTransitionPage<dynamic> createPageBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return CustomTransitionPage(
      child: buildWidget(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }

  void go(BuildContext context, {Product? product}) {
    if (this == NavigationTypes.productDetail) {
      if (product == null) {
        log('You must provide a product to navigate to product detail screen');
        return;
      }
      context.read<ProductViewModel>().selectProduct(product);
    }
    context.goNamed(name);
  }

  Widget buildWidget(BuildContext context, GoRouterState state) {
    switch (this) {
      case NavigationTypes.auth:
        return const AuthScreen();
      case NavigationTypes.home:
        return const HomeScreen();
      case NavigationTypes.productDetail:
        return const ProductDetailScreen();
      case NavigationTypes.settings:
        return const SettingsScreen();
      case NavigationTypes.chat:
        return const ChatScreen();
      case NavigationTypes.profile:
        return const ProfileScreen();
    }
  }
}
