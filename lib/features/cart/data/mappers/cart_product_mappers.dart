import 'package:ecommerce/features/cart/data/models/cart_product_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_product_entities.dart';

extension CartProductMappers on CartProductModel {
  CartProduct get toEntity => CartProduct(
        id: id,
        title: title,
        quantity: quantity,
        imageCover: imageCover,
        ratingsAverage: ratingsAverage,
      );
}
