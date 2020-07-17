import 'package:formz/formz.dart';

enum FirstnameValidationError { invalid }

class FirstnameInput extends FormzInput<String, FirstnameValidationError> {
  const FirstnameInput.pure() : super.pure('');
  const FirstnameInput.dirty([String value = '']) : super.dirty(value);

  @override
  FirstnameValidationError validator(String value) {
    if(value.isEmpty == false){
      return value.length >= 3 ? null : FirstnameValidationError.invalid;
    } else {
      return null;
    }
  }
}

enum LastnameValidationError { invalid }

class LastnameInput extends FormzInput<String, LastnameValidationError> {
  const LastnameInput.pure() : super.pure('');
  const LastnameInput.dirty([String value = '']) : super.dirty(value);

  @override
  LastnameValidationError validator(String value) {
    if(value.isEmpty == false){
      return value.length >= 3 ? null : LastnameValidationError.invalid;
    } else {
      return null;
    }
  }
}

enum EmailValidationError { invalid }

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([String value = '']) : super.dirty(value);


  @override
  EmailValidationError validator(String value) {
    return value.contains('@') ? null : EmailValidationError.invalid;
  }
}
