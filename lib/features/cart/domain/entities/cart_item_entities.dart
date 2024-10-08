import 'package:ecommerce/features/cart/domain/entities/cart_product_entities.dart';

class CartItemData {
  final int count;
  final String id;
  final CartProduct product;
  final int price;

  const CartItemData({
   required this.count,
   required this.id,
   required this.product,
   required this.price,
  });
}
