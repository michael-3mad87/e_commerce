import 'package:ecommerce/core/resources/color_manager.dart';

import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  CircularProgressIndicator(
        color: ColorManager.primary,
      ),
    );
  }
}
