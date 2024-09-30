part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterError extends AuthState {
  final String errorMessage;
  RegisterError(this.errorMessage);
}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginError extends AuthState {
  final String errorMessage;
  LoginError(this.errorMessage);
}
