import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/repository/auth_repository.dart';


import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
   final AuthRepository repository;
  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());

    final result = await repository.register(request);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await repository.login(request);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
