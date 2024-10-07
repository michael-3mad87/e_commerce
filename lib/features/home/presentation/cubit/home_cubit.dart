import 'package:bloc/bloc.dart';

import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/use_case/get_categories.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  final GetCategories _getCategories;
  HomeCubit(
    this._getCategories,
  ) : super(HomeInitial()) {
    getCategories();
  }
  Future<void> getCategories() async {
    final result = await _getCategories();
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (categories) => emit(HomeSuccess(categories)),
    );
  }
}
