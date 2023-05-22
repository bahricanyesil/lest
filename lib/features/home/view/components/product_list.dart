part of '../home_screen.dart';

class _ProductGrid extends StatelessWidget {
  const _ProductGrid({required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: constraints.maxWidth / constraints.maxHeight,
            ),
            itemBuilder: _gridItemBuilder,
          );
        },
      );

  Widget _gridItemBuilder(BuildContext context, int index) {
    final product = products[index];
    return SizedBox(
      height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: _cardBuilder(context, product),
      ),
    );
  }

  Widget _cardBuilder(BuildContext context, Product product) => InkWell(
        onTap: () =>
            NavigationTypes.productDetail.go(context, product: product),
        child: ProductCard(product: product),
      );
}
