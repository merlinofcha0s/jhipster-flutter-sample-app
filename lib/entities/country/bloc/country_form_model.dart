import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/country/country_model.dart';

enum CountryNameValidationError { invalid }
class CountryNameInput extends FormzInput<String, CountryNameValidationError> {
  const CountryNameInput.pure() : super.pure('');
  const CountryNameInput.dirty([String value = '']) : super.dirty(value);

  @override
  CountryNameValidationError validator(String value) {
    return null;
  }
}

