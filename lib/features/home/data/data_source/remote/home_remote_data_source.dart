import 'package:ecommerce/features/home/data/models/category_response.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryResponse> getCategory();
}
