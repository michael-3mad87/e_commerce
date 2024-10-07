import 'package:ecommerce/features/products/data/models/products_response.dart';

abstract class ProductsRemoteDataSources {
  Future<ProductsResponse> getProduct(String? categoryId);
}
