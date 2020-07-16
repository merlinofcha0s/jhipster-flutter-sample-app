import 'package:formz/formz.dart';

enum LoginValidationError { invalid }

class LoginInput extends FormzInput<String, LoginValidationError> {
  const LoginInput.pure() : super.pure('');
  const LoginInput.dirty([String value = '']) : super.dirty(value);

  @override
  LoginValidationError validator(String value) {
    return value.length >= 3 ? null : LoginValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegex =
  RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError validator(String value) {
    return _passwordRegex.hasMatch(value) ? null
        : PasswordValidationError.invalid;
  }
}
