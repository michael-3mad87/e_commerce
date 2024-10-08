import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_sources.dart';
import 'package:ecommerce/features/products/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRemoteDataSources)
class ProductsApiDataSources implements ProductsRemoteDataSources {
  final Dio dio;
  ProductsApiDataSources(this.dio);
  @override
  Future<ProductsResponse> getProduct(String? categoryId) async {
    try {
      final response = await dio.get(
        APIConstants.productsEndPoint,
        queryParameters: {
          if (categoryId != null) 'category': categoryId,
        },
      );
      return ProductsResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to get products');
    }
  }
}
