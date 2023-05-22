import 'package:flutter/material.dart';
import 'package:lest/core/constants/type_definitions.dart';
import 'package:lest/core/widgets/bottom-nav-bar/models/bottom_nav_bar_item.dart';
import 'package:lest/features/home/view-model/home_view_model.dart';
import 'package:lest/product/theme/custom_colors.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({required this.items, super.key});
  final List<BottomNavBarItemTypes> items;

  @override
  CustomBottomNavBarState createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final List<AnimationController> _animationControllers = [];
  late final List<BottomNavBarItemTypes> items = widget.items;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < items.length; i++) {
      _animationControllers.add(
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 300),
        ),
      );
    }
    _animationControllers[0].forward();
  }

  @override
  void dispose() {
    for (final controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _animationControllers[_selectedIndex].reverse();
      _animationControllers[index].forward();
      _selectedIndex = index;
    });
    context.read<HomeViewModel>().onBottomItemTapped(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CustomColors.primaryColor,
      elevation: 8,
      padding: EdgeInsets.zero,
      child: Row(
        children: List<Widget>.generate(
          items.length,
          (int i) => Expanded(
            child: _BottomNavBarItem(
              onTap: _onItemTapped,
              item: items[i],
              animation: _animationControllers[i],
              isSelected: _selectedIndex == i,
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    required this.onTap,
    required this.item,
    required this.animation,
    this.isSelected = false,
  });
  final IndexTapped onTap;
  final BottomNavBarItemTypes item;
  final AnimationController animation;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: InkWell(
        onTap: () => onTap(BottomNavBarItemTypes.values.indexOf(item)),
        splashColor: CustomColors.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => _animatedBuilder(context, child, item),
          child: const SizedBox(height: 4),
        ),
      ),
    );
  }

  Widget _animatedBuilder(
    BuildContext context,
    Widget? child,
    BottomNavBarItemTypes item,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: isSelected
            ? CustomColors.secondaryColor.withOpacity(0.2)
            : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: SizedBox(height: 55, child: _itemColumn(context, child!)),
        ),
      ),
    );
  }

  Widget _itemColumn(BuildContext context, Widget child) {
    final color = isSelected ? CustomColors.secondaryColor : Colors.white70;
    final itemSize = 22.5 + (animation.value * 4);
    final textSize = 13.5 + (animation.value * 2);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(item.icon, color: color, size: itemSize),
        child,
        Text(
          item.text,
          style: TextStyle(fontSize: textSize, color: color),
        ),
      ],
    );
  }
}
