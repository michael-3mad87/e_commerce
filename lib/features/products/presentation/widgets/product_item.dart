import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/heart_button.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/products/domain/entities/products_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    required this.product,
  });
  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.productDetails,
        arguments: widget.product,
      ),
      child: Container(
        width: screenSize.width * 0.4,
        height: screenSize.height * 0.3,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(14.r)),
                    child: CachedNetworkImage(
                      imageUrl: widget.product.imageCoverURL,
                      width: screenSize.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  PositionedDirectional(
                    top: screenSize.height * 0.01,
                    end: screenSize.width * 0.02,
                    child: HeartButton(onTap: () {}),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _truncateTitle(widget.product.title),
                      style: getMediumStyle(
                        color: ColorManager.text,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.002),
                    Text(
                      _truncateDescription(widget.product.description),
                      style: getRegularStyle(
                        color: ColorManager.text,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.005),
                    SizedBox(
                      width: screenSize.width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP ${widget.product.priceAfterDiscount ?? widget.product.price}',
                            style: getRegularStyle(
                              color: ColorManager.text,
                              fontSize: 14.sp,
                            ),
                          ),
                          Visibility(
                            visible: widget.product.priceAfterDiscount != null,
                            child: Text(
                              '${widget.product.price}',
                              style: getTextWithLine(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Review (${widget.product.ratingsAverage})',
                                style: getRegularStyle(
                                  color: ColorManager.text,
                                  fontSize: 12.sp,
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starRate,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<CartCubit>()
                                  .addToCart(widget.product.id);
                            },
                            child: Container(
                              height: screenSize.height * 0.027,
                              width: screenSize.width * 0.08,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.primary,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateTitle(String title) {
    final List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return '${words.sublist(0, 2).join(' ')}..';
    }
  }

  String _truncateDescription(String description) {
    final List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return '${words.sublist(0, 4).join(' ')}..';
    }
  }
}
