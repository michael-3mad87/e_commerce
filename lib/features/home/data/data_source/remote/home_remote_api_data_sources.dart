import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';

import 'package:ecommerce/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/category_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteApiDataSources implements HomeRemoteDataSource {
  final Dio _dio;
  const HomeRemoteApiDataSources(this._dio);
  @override
  Future<CategoryResponse> getCategory() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndPoint);
      return CategoryResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to get Categories');
    }
  }
}
