part of '../home_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDeco.primaryRounded,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product.imageUrl ?? product.name ?? '',
              child: product.imageUrl.coveredNetworkImage(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 6, right: 6, top: 5, bottom: 1),
            child: NameProducerRow(product: product),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 6, right: 6, top: 1, bottom: 5),
            child: ProductCardIconRow(product: product),
          ),
        ],
      ),
    );
  }
}

class ProductCardIconRow extends StatelessWidget {
  const ProductCardIconRow({
    required this.product,
    this.iconColor,
    this.textColor,
    this.scaleFactor = 1,
    super.key,
  });
  final Product product;
  final Color? iconColor;
  final Color? textColor;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.scale(
            scale: scaleFactor,
            child: TextWithIcon(
              iconData: Icons.attach_money_outlined,
              text: product.price?.toString() ?? '',
              iconColor: iconColor,
              textStyle: TextStyle(color: textColor),
            ),
          ),
          Transform.scale(
            scale: scaleFactor,
            child: TextWithIcon(
              iconData: Icons.star_outline,
              text: product.rating?.toString() ?? '',
              iconColor: iconColor,
              textStyle: TextStyle(color: textColor),
            ),
          ),
          Transform.scale(scale: scaleFactor, child: _distanceWidget),
        ],
      );

  Widget get _distanceWidget => Selector<SplashViewModel, Position>(
        builder: (_, Position position, __) {
          final formattedDistance =
              position.distanceFormatted(product.lat, product.lon);
          return TextWithIcon(
            iconData: Icons.place_outlined,
            text: '${formattedDistance}km',
            textStyle:
                TextStyle(wordSpacing: .1, letterSpacing: .1, color: textColor),
            iconColor: iconColor,
          );
        },
        selector: (_, viewModel) => viewModel.position,
      );
}

class NameProducerRow extends StatelessWidget {
  const NameProducerRow({
    required this.product,
    this.nameStyle,
    this.producerStyle,
    super.key,
  });
  final Product product;
  final TextStyle? nameStyle;
  final TextStyle? producerStyle;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            product.name ?? '',
            style: nameStyle ??
                context.bodyM
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              'by ${product.producer ?? ''}',
              style: producerStyle ??
                  context.labelM.copyWith(color: Colors.white, fontSize: 11),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
}
