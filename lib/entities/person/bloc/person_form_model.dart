import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/person/person_model.dart';

enum FirstNameValidationError { invalid }
class FirstNameInput extends FormzInput<String, FirstNameValidationError> {
  const FirstNameInput.pure() : super.pure('');
  const FirstNameInput.dirty([String value = '']) : super.dirty(value);

  @override
  FirstNameValidationError validator(String value) {
    return null;
  }
}

enum LastNameValidationError { invalid }
class LastNameInput extends FormzInput<String, LastNameValidationError> {
  const LastNameInput.pure() : super.pure('');
  const LastNameInput.dirty([String value = '']) : super.dirty(value);

  @override
  LastNameValidationError validator(String value) {
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

