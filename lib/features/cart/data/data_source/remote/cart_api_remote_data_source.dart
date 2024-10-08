import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio dio;
  const CartApiRemoteDataSource(this.dio);
  @override
  Future<void> addToCart(String productId) async {
    try {
      await dio.post(
        APIConstants.cartEndPoint,
        data: {
          'productId': productId,
        },
      );
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to add to Cart');
    }
  }

  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await dio.get(
        APIConstants.cartEndPoint,
      );
      return CartResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to get  Cart');
    }
  }

  @override
  Future<CartResponse> updateCart(String productId, int quantity) async {
    try {
      final response = await dio.put(
        '${APIConstants.cartEndPoint}/$productId',
        data: {
          'count': quantity,
        },
      );
      return CartResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to update Cart');
    }
  }

  @override
  Future<CartResponse> deleteFromCart(String productId) async {
    try {
      final response = await dio.put('${APIConstants.cartEndPoint}/$productId');
      return CartResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to delete Cart');
    }
  }
}
