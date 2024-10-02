import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/use_case/login.dart';
import 'package:ecommerce/features/auth/domain/use_case/register.dart';

import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final Login _login;
  final Register _register;
  AuthCubit(this._login , this._register) : super(AuthInitial());

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());

    final result = await _register(request);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _login(request);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
