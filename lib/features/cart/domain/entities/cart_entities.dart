
import 'package:ecommerce/features/cart/domain/entities/cart_item_entities.dart';

class Cart {
  final List<CartItemData> items;
  final int totalCartPrice;
  const Cart({

    required this.items,
    required this.totalCartPrice,
  });
}
