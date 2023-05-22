import 'package:flutter/material.dart';
import 'package:lest/features/home/view/components/home_app_bar_search_delegate.dart';
import 'package:lest/product/constants/image_paths.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.showSearchOption = false,
    super.key,
  });

  final String title;
  final bool showSearchOption;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
          child: Image.asset(ImagePaths.logoWithoutBg),
        ),
        title: Text(title, textAlign: TextAlign.start),
        centerTitle: true,
        actions: [
          if (showSearchOption)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async => _showSearch(context),
            ),
          const SizedBox(width: 20),
        ],
      );

  Future<void> _showSearch(BuildContext context) async {
    final result = await showSearch<String>(
      context: context,
      delegate: HomeAppBarSearchDelegate(),
    );

    if (result != null && result.isNotEmpty) {
      // onSearch(result);
    }
  }
}
