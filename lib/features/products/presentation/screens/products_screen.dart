

import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';

import 'package:ecommerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen();

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final String categoryId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: BlocProvider(
        create: (context) => serviceLocator.get<ProductCubit>()..getProduct(categoryId),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const LoadingIndicator();
            } else if (state is ProductError) {
              return ErrorIndicator(message: state.message!);
            } else if (state is ProductSuccess) {
            return  GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 7 / 9,
                ),
                itemBuilder: (_, index) => ProductItem(product:state.products [index]),
                padding: EdgeInsets.all(Insets.s16.sp),
                itemCount: state.products.length,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
