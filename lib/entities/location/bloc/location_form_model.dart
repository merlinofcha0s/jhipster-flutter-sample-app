import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/location/location_model.dart';

enum StreetAddressValidationError { invalid }
class StreetAddressInput extends FormzInput<String, StreetAddressValidationError> {
  const StreetAddressInput.pure() : super.pure('');
  const StreetAddressInput.dirty([String value = '']) : super.dirty(value);

  @override
  StreetAddressValidationError validator(String value) {
    return null;
  }
}

enum PostalCodeValidationError { invalid }
class PostalCodeInput extends FormzInput<String, PostalCodeValidationError> {
  const PostalCodeInput.pure() : super.pure('');
  const PostalCodeInput.dirty([String value = '']) : super.dirty(value);

  @override
  PostalCodeValidationError validator(String value) {
    return null;
  }
}

enum CityValidationError { invalid }
class CityInput extends FormzInput<String, CityValidationError> {
  const CityInput.pure() : super.pure('');
  const CityInput.dirty([String value = '']) : super.dirty(value);

  @override
  CityValidationError validator(String value) {
    return null;
  }
}

enum StateProvinceValidationError { invalid }
class StateProvinceInput extends FormzInput<String, StateProvinceValidationError> {
  const StateProvinceInput.pure() : super.pure('');
  const StateProvinceInput.dirty([String value = '']) : super.dirty(value);

  @override
  StateProvinceValidationError validator(String value) {
    return null;
  }
}

