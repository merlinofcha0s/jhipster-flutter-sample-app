import 'package:formz/formz.dart';

enum FirstnameValidationError { invalid }

class FirstnameInput extends FormzInput<String, FirstnameValidationError> {
  const FirstnameInput.pure() : super.pure('');
  const FirstnameInput.dirty([String value = '']) : super.dirty(value);

  @override
  FirstnameValidationError validator(String value) {
    return null;
  }
}

enum LastnameValidationError { invalid }

class LastnameInput extends FormzInput<String, LastnameValidationError> {
  const LastnameInput.pure() : super.pure('');
  const LastnameInput.dirty([String value = '']) : super.dirty(value);

  static int numberMin = 3;

  @override
  LastnameValidationError validator(String value) {
    return null;
  }
}

enum EmailValidationError { invalid }

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError validator(String value) {
    return null;
  }
}

enum PhoneNumberValidationError { invalid }

class PhoneNumberInput extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumberInput.pure() : super.pure('');
  const PhoneNumberInput.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneNumberValidationError validator(String value) {
    return null;
  }
}

enum HireDateValidationError { invalid }

class HireDateInput extends FormzInput<String, HireDateValidationError> {
  const HireDateInput.pure() : super.pure('');
  const HireDateInput.dirty([String value]) : super.dirty(value);

  @override
  HireDateValidationError validator(String value) {
    return null;
  }
}

enum SalaryValidationError { invalid }

class SalaryInput extends FormzInput<int, SalaryValidationError> {
  const SalaryInput.pure() : super.pure(0);
  const SalaryInput.dirty([int value]) : super.dirty(value);

  @override
  SalaryValidationError validator(int value) {
    return null;
  }
}

enum CommissionValidationError { invalid }

class CommissionInput extends FormzInput<int, CommissionValidationError> {
  const CommissionInput.pure() : super.pure(0);
  const CommissionInput.dirty([int value]) : super.dirty(value);

  @override
  CommissionValidationError validator(int value) {
    return null;
  }
}
