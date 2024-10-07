import 'package:ecommerce/core/models/metadata.dart';

import '../../../../core/models/category_model.dart';


class CategoryResponse {
  final int results;
  final Metadata metadata;
  final List<CategoryModel> categories;

  const CategoryResponse({
    required this.results,
    required this.metadata,
    required this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      results: json['results'] as int,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      categories: (json['data'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
