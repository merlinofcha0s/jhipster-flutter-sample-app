import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/region/region_model.dart';

enum RegionNameValidationError { invalid }
class RegionNameInput extends FormzInput<String, RegionNameValidationError> {
  const RegionNameInput.pure() : super.pure('');
  const RegionNameInput.dirty([String value = '']) : super.dirty(value);

  @override
  RegionNameValidationError validator(String value) {
    return null;
  }
}

