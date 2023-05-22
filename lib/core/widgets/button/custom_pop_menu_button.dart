import 'package:flutter/material.dart';
import 'package:lest/core/extensions/string_extensions.dart';
import 'package:lest/product/theme/custom_colors.dart';

/// Pop menu button.
class PopMenuButton extends StatefulWidget {
  /// Default constructor.
  const PopMenuButton({
    required this.values,
    required this.selectedValue,
    required this.onTap,
    this.translated = true,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.icons = const <String>[],
    this.highlight = false,
    this.iconWidthFactor,
    this.titlePaddingFactor,
    this.offset,
    this.height,
    this.width,
    this.childPadding,
    this.padding,
    this.enabled = true,
    this.position = PopupMenuPosition.under,
    this.onCanceled,
    this.capitalize = false,
    this.optColor,
    this.alignment,
    this.decoration,
    this.capitalizeChoice = false,
    super.key,
  });
  // --> Assert about the length of values and icons.

  /// All values.
  final List<String> values;

  /// Selected value.
  final String selectedValue;

  /// On tap callback.
  final ValueChanged<String> onTap;

  /// Whether the texts are flat.
  final bool translated;

  /// Enabled.
  final bool enabled;

  /// Whether to capitalize.
  final bool capitalize;

  /// Main alignment.
  final MainAxisAlignment mainAxisAlignment;

  /// Custom icon.
  final String? icon;

  /// All values.
  final List<String> icons;

  /// Whether to highlight on hover.
  final bool highlight;

  /// Icon width factor.
  final double? iconWidthFactor;

  /// Title padding factor.
  final double? titlePaddingFactor;

  /// Offset
  final Offset? offset;

  /// Height value.
  final double? height;

  /// width value.
  final double? width;

  /// Child padding.
  final EdgeInsets? childPadding;

  /// padding.
  final EdgeInsets? padding;

  /// Pop menu position
  final PopupMenuPosition position;

  /// On canceled callback.
  final VoidCallback? onCanceled;

  /// Optional custom color.
  final Color? optColor;

  /// Alignment.
  final Alignment? alignment;

  /// Box Deco.
  final BoxDecoration? decoration;

  /// capitalizeChoice
  final bool capitalizeChoice;

  @override
  State<PopMenuButton> createState() => _PopMenuButtonState();
}

class _PopMenuButtonState extends State<PopMenuButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final textColor = CustomColors.primaryColor;
    return Container(
      alignment: widget.alignment,
      decoration: widget.decoration,
      padding: widget.padding,
      width: widget.width,
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: PopupMenuButton<String>(
          onSelected: (String? val) {},
          onCanceled: widget.onCanceled,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          elevation: 6,
          color: Colors.white.withOpacity(.9),
          itemBuilder: (BuildContext context) => widget.values
              .map((String choice) => _popMenuItem(choice, context, textColor))
              .toList(),
          offset: widget.offset ?? Offset.zero,
          position: widget.position,
          enabled: widget.enabled,
          tooltip: widget.enabled ? null : '🚫',
          child: Padding(
            padding: widget.childPadding ??
                const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: _popMenuChild(context, textColor),
          ),
        ),
        onHover: (bool val) {
          if (mounted) setState(() => _isHover = val);
        },
      ),
    );
  }

  Widget _popMenuChild(BuildContext context, Color? textColor) => Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.icon != null)
            Image.asset(
              widget.icon!,
              color: widget.optColor,
              width: 22,
            ),
          if (widget.icon != null) const SizedBox(width: 3),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.titlePaddingFactor ?? .6,
              ),
              child: Text(
                widget.capitalize
                    ? widget.selectedValue.toUpperCase()
                    : widget.selectedValue,
                style: TextStyle(color: widget.optColor),
              ),
            ),
          ),
          if (widget.enabled)
            Icon(
              Icons.arrow_drop_down_outlined,
              size: 20 * (widget.highlight && _isHover ? 1.2 : 1),
              color: widget.optColor,
            ),
        ],
      );

  PopupMenuItem<String> _popMenuItem(
    String choice,
    BuildContext context,
    Color? textColor,
  ) {
    final isSelected = widget.selectedValue.uncaseEqual(choice);
    return PopupMenuItem<String>(
      value: choice,
      height: widget.height ?? 30,
      onTap: () => widget.onTap(choice),
      child: Row(
        children: <Widget>[
          if (widget.icons.isNotEmpty)
            Image.asset(
              widget.icons[widget.values.indexOf(choice)],
              width: 20,
            ),
          if (widget.icons.isNotEmpty) const SizedBox(width: 5),
          Padding(
            padding: _padding(context),
            child: Text(
              widget.capitalizeChoice ? choice.toUpperCase() : choice,
              style: TextStyle(
                color: isSelected ? textColor : null,
                fontWeight: isSelected ? FontWeight.bold : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _padding(BuildContext context) => widget.icons.isNotEmpty
      ? EdgeInsets.symmetric(horizontal: widget.titlePaddingFactor ?? 2.2)
      : EdgeInsets.zero;
}
