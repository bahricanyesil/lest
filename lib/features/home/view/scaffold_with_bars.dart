import 'package:flutter/material.dart';
import 'package:lest/core/widgets/bottom-nav-bar/bottom_navigation_bar.dart';
import 'package:lest/core/widgets/bottom-nav-bar/models/bottom_nav_bar_item.dart';
import 'package:lest/features/home/view-model/home_view_model.dart';
import 'package:lest/features/product/view-model/product_view_model.dart';
import 'package:lest/features/splash/view-model/splash_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ScaffoldWithBars extends StatelessWidget {
  const ScaffoldWithBars({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProxyProvider<SplashViewModel, HomeViewModel>(
            lazy: true,
            create: (BuildContext context) =>
                HomeViewModel(context.read<SplashViewModel>().position),
            update: (_, SplashViewModel model, HomeViewModel? homeModel) {
              final updatedModel = homeModel ?? HomeViewModel(model.position);
              return updatedModel;
            },
          ),
          ChangeNotifierProvider(create: (_) => ProductViewModel())
        ],
        child: Scaffold(
          body: child,
          bottomNavigationBar:
              const CustomBottomNavBar(items: BottomNavBarItemTypes.values),
        ),
      );
}
