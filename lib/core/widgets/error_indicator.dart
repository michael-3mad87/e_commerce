import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String message;

  const ErrorIndicator({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Icon(
              Icons.error_outline,
              color: Colors.redAccent,
              size: 80.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Oops!',
              style: getMediumStyle(
                    color: ColorManager.error,
                    
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              message,
              textAlign: TextAlign.center,
              style:getMediumStyle(
                    fontSize: FontSize.s16,
                    color:ColorManager.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
