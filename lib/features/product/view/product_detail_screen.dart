import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lest/core/extensions/context_extensions.dart';
import 'package:lest/core/extensions/string_extensions.dart';
import 'package:lest/features/home/models/product_model.dart';
import 'package:lest/features/home/view/home_screen.dart';
import 'package:lest/features/product/view-model/product_view_model.dart';
import 'package:lest/product/theme/custom_colors.dart';
import 'package:lest/product/widgets/map/map_view.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductViewModel>().selectedProduct;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              automaticallyImplyLeading: false,
              flexibleSpace: _flexibleSpaceAppBar(context, product),
            ),
            if (product != null)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: _SliverProductContent(product: product),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _flexibleSpaceAppBar(BuildContext context, Product? product) =>
      FlexibleSpaceBar(
        background: Stack(
          children: [
            Hero(
              tag: product?.imageUrl ?? product?.name ?? '',
              child: product?.imageUrl?.coveredNetworkImage() ?? Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.primaryColor.withOpacity(.5),
                ),
                child: _backButton(context),
              ),
            ),
          ],
        ),
      );

  Widget _backButton(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        iconSize: 28,
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(3),
        onPressed: context.pop,
      );
}

class _SliverProductContent extends StatelessWidget {
  const _SliverProductContent({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameProducerRow(
            product: product,
            nameStyle: context.titleL,
            producerStyle: context.titleS,
          ),
          const SizedBox(height: 5),
          Text(
            product.description ?? '',
            style: context.bodyM,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ProductCardIconRow(
              product: product,
              iconColor: CustomColors.primaryColor,
              textColor: CustomColors.primaryColor,
              scaleFactor: 1.25,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(CustomColors.primaryColor),
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
              icon: const Icon(Icons.gavel_outlined, color: Colors.white),
              label: Text(
                'Make an Offer',
                style: context.titleM
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: MapView(lat: product.lat ?? 0, long: product.lon ?? 0),
          ),
        ],
      );
}
