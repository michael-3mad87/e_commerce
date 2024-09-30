import 'package:ecommerce/features/products/presentation/widgets/color_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColor extends StatefulWidget {
  final List<Color> color;
  final void Function() onSelected;

  const ProductColor({
    required this.color,
    required this.onSelected,
  });

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = index);
                widget.onSelected();
              },
              child: ColorItem(
                color: widget.color[index],
                index: index,
                selectedIndex: _selectedIndex,
              ),
            ),
            separatorBuilder: (_, __) => SizedBox(
              width: 17.w,
            ),
            itemCount: widget.color.length,
          ),
        ),
      ],
    );
  }
}
