import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lest/core/extensions/context_extensions.dart';
import 'package:lest/core/extensions/location_extensions.dart';
import 'package:lest/core/extensions/string_extensions.dart';
import 'package:lest/core/widgets/appbar/appbar.dart';
import 'package:lest/core/widgets/text/text_with_icon.dart';
import 'package:lest/features/home/models/category_model.dart';
import 'package:lest/features/home/models/product_model.dart';
import 'package:lest/features/home/view-model/home_view_model.dart';
import 'package:lest/features/splash/view-model/splash_view_model.dart';
import 'package:lest/product/constants/app_constants.dart';
import 'package:lest/product/constants/box_decorations.dart';
import 'package:lest/product/constants/navigation_types.dart';
import 'package:lest/product/extensions/product_list_extensions.dart';
import 'package:provider/provider.dart';

part 'components/product_card.dart';
part 'components/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<bool> _initializeAppResult;

  @override
  void initState() {
    super.initState();
    _initializeAppResult = _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            return _loadedView(context);
          }
        }
        return Text('State: ${snapshot.connectionState}');
      },
      future: _initializeAppResult,
    );
  }

  Future<bool> _initializeApp() async {
    await context.read<SplashViewModel>().initializeApp();
    return true;
  }

  Widget _loadedView(BuildContext context) {
    final products = context.watch<HomeViewModel>().products;
    final fruits = products.filterByCateName(Category.fruit().name);
    final vegetables = products.filterByCateName(Category.vegetable().name);
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppConstants.appName,
        showSearchOption: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _categoryTitle(context, 'Fruits'),
          Flexible(child: _ProductGrid(products: fruits)),
          _categoryTitle(context, 'Vegetables'),
          Flexible(child: _ProductGrid(products: vegetables)),
        ],
      ),
    );
  }

  Widget _categoryTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 3),
      child: Text(
        title,
        style: context.titleL.copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
