import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) =>
    TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight,
    );

TextStyle getLightStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.light,
      color,
    );

TextStyle getRegularStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.regular,
      color,
    );

TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.medium,
      color,
    );

TextStyle getSemiBoldStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.semiBold,
      color,
    );

TextStyle getBoldStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.bold,
      color,
    );

TextStyle getTextWithLine() => TextStyle(
      color: ColorManager.primary,
      fontSize: FontSize.s12,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.lineThrough,
      decorationColor: ColorManager.primary,
    );
