import 'package:flutter/material.dart';
import 'package:lest/core/extensions/context_extensions.dart';
import 'package:lest/core/extensions/string_extensions.dart';
import 'package:lest/core/widgets/clipper/clip_rounded_only.dart';
import 'package:lest/features/home/models/product_model.dart';
import 'package:lest/features/home/view-model/home_view_model.dart';
import 'package:lest/features/home/view/home_screen.dart';
import 'package:lest/product/constants/navigation_types.dart';
import 'package:lest/product/theme/custom_colors.dart';
import 'package:provider/provider.dart';

class HomeAppBarSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final products =
        context.read<HomeViewModel>().products.filteredProducts(query);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          ProductSearchCard(product: products[index]),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: products.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final products =
        context.read<HomeViewModel>().products.filteredProducts(query);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          ProductSearchCard(product: products[index]),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: products.length,
    );
  }
}

class ProductSearchCard extends StatelessWidget {
  const ProductSearchCard({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationTypes.productDetail.go(context, product: product),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.primaryColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.only(right: 10),
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            _productImage(),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: _detailColumn(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Hero _productImage() => Hero(
        tag: product.imageUrl ?? product.name ?? '',
        child: ClipRoundedOnly(
          cornerTypes: CornerTypeLists.l,
          child: product.imageUrl.coveredNetworkImage(width: 115),
        ),
      );

  Column _detailColumn(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          NameProducerRow(product: product),
          const SizedBox(height: 1.6),
          _description(context),
          const SizedBox(height: 3.5),
          ProductCardIconRow(product: product, scaleFactor: .96),
        ],
      );

  Widget _description(BuildContext context) => Text(
        product.description ?? '',
        style: context.labelM.copyWith(
          fontSize: 10.5,
          color: Colors.white.withOpacity(.8),
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
}
